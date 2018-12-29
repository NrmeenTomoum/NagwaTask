//
//  HomeWorkerCoreData.swift
//  NagwaTask
//
//  Created by Nrmeen Tomoum on 12/29/18.
//  Copyright © 2018 Nagwa. All rights reserved.
//

import Foundation
import CoreData

class HomeWorkerCoreData: RepositoryProtocol
{
    // MARK: - Managed object contexts
    
    var mainManagedObjectContext: NSManagedObjectContext
    var privateManagedObjectContext: NSManagedObjectContext
    
    // MARK: - Object lifecycle
    
    init()
    {
        // This resource is the same name as your xcdatamodeld contained in your project.
        guard let modelURL = Bundle.main.url(forResource: "NagwaTask", withExtension: "momd") else {
            fatalError("Error loading model from bundle")
        }
        
        // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }
        
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        mainManagedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        mainManagedObjectContext.persistentStoreCoordinator = psc
        
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docURL = urls[urls.endIndex-1]
        /* The directory the application uses to store the Core Data store file.
         This code uses a file named "DataModel.sqlite" in the application's documents directory.
         */
        let storeURL = docURL.appendingPathComponent("CleanStore.sqlite")
        do {
            try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        } catch {
            fatalError("Error migrating store: \(error)")
        }
        
        privateManagedObjectContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        privateManagedObjectContext.parent = mainManagedObjectContext
    }
    
    deinit
    {
        do {
            try self.mainManagedObjectContext.save()
        } catch {
            fatalError("Error deinitializing main managed object context")
        }
    }
    
    // MARK: - CRUD operations - Optional error
   
    func getRepositories(request: Home.Repository.Request, completionHandler: @escaping ([Home.Repository.Response]?, errorMessage?, errorMessage?) -> Void) {
        privateManagedObjectContext.perform {
            do {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "RepositoriesModel")
                let results = try self.privateManagedObjectContext.fetch(fetchRequest) as! [RepositoriesModel]
                let repositories = results.map { $0.toRepository() }
                completionHandler(repositories,nil,nil)
            } catch {
                completionHandler([],errorMessage(message:"Cannot fetch repositories") ,nil)
            }
        }
    }
    
    func createRepository(repositoryToCreate: Home.Repository.Response, completionHandler: @escaping (Home.Repository.Response?, errorMessage?) -> Void)
    {
        privateManagedObjectContext.perform {
            do {
                let managedRepository = NSEntityDescription.insertNewObject(forEntityName: "RepositoriesModel", into: self.privateManagedObjectContext) as! RepositoriesModel
                var repository = repositoryToCreate
                 managedRepository.fromRepository(repository: repository)
                try self.privateManagedObjectContext.save()
                completionHandler(repository, nil)
            } catch {
                completionHandler(nil, errorMessage(message:"Cannot create order with id \(String(describing: repositoryToCreate.id))"))
            }
        }
}

}
