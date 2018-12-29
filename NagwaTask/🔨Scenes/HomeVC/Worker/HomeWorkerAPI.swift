//
//  HomeWorkerAPI.swift
//  NagwaTask
//
//  Created by Nrmeen Tomoum on 12/29/18.
//  Copyright © 2018 Nagwa. All rights reserved.
//

import Foundation
class HomeWorkerAPI : RepositoryProtocol
{
    func getRepositories( request : Home.Repository.Request,  completionHandler: @escaping ([Home.Repository.Response]?,errorMessage?,errorMessage? ) -> Void)
    {
        var urlParameters : [String : AnyObject] = [:]
        let URL = Constants.Server.Services.getRepositories + "page=\(request.page)&per_page=\(request.size)"
        
        GenericRequest.requestGetMappable(URL: URL) {
            (result:[Home.Repository.Response]?, errorMessage, serverError)  in
            completionHandler(result  , errorMessage ,serverError )
        }
    }
}
