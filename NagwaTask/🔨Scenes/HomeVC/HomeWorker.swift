//
//  HomeWorker.swift
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
protocol RepositoryProtocol
{
    func getRepositories( request : Home.Repository.Request,  completionHandler: @escaping ([Home.Repository.Response]?,errorMessage?,errorMessage? ) -> Void)
}
class HomeWorker
{
    var repository: RepositoryProtocol
    
    init(repository: RepositoryProtocol)
    {
        self.repository = repository
    }
    
    func getRepositories( request : Home.Repository.Request,  completionHandler: @escaping ([Home.Repository.Response]?,errorMessage?,errorMessage? ) -> Void)
    {
        repository.getRepositories(request: request) { (result, errorMessage, serverError) in
            completionHandler(result  , errorMessage ,serverError )
        }
        
    }
}

