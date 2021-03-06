//
//  HomeInteractor.swift
//  NagwaTask
//
//  Created by Nrmeen Tomoum on 12/28/18.
//  Copyright (c) 2018 Nagwa. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomeBusinessLogic
{
    func getRepositories(request: Home.Repository.Request, fromAPIOrCD : Bool)
}

protocol HomeDataStore
{
    //var name: String { get set }
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore
{
    let network = NetworkManager.sharedInstance
    var presenter: HomePresentationLogic?
    var worker: HomeWorker?
    //var name: String = ""
    init() {
     
        //        network.reachability.whenUnreachable = { reachability in
        //            self.worker = HomeWorker(repository: HomeWorkerCoreData())
        //        }
        //        network.reachability.whenReachable = { reachability in
        //          self.worker = HomeWorker(repository: HomeWorkerAPI())
        //        }
        //
    }
    // MARK: Do something
    func getRepositories(request: Home.Repository.Request, fromAPIOrCD : Bool)
    {
        if fromAPIOrCD == true
        {
            self.worker = HomeWorker(repository: HomeWorkerAPI())
        }
        else
        {
            self.worker = HomeWorker(repository: HomeWorkerCoreData())
        }
        //        self.presenter?.presentLoader()
        
        worker?.getRepositories( request : request , completionHandler: { (result, errorMessage, serverError) in
            //   self.presenter?.presentStopLoader()
            if let response = result
            {
                self.presenter?.presentListOfRepositories(response: response)
            }
            else if let error = errorMessage
            {
                self.presenter?.presentAlertMessage(message: (errorMessage?.message)!)
            }
            else
            {
                self.presenter?.presentAlertMessage(message: (serverError?.message)!)
            }
        })
    }
    
    
}
