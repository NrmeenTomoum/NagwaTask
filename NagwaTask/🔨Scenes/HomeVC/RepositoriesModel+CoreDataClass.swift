//
//  RepositoriesModel+CoreDataClass.swift
//  
//
//  Created by Nrmeen Tomoum on 12/29/18.
//
//

import Foundation
import CoreData


public class RepositoriesModel: NSManagedObject {
    func toRepository() -> Home.Repository.Response
    {
        return Home.Repository.Response(id: Int(id), name: name!, desc: reposDesc ?? "")
    }
    func fromRepository(repository: Home.Repository.Response)
    {
        id = Int64(repository.id!)
        name = repository.name!
        reposDesc = repository.description
    }
}
