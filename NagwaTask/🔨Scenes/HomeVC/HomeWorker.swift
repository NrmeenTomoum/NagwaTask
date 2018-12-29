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
class HomeWorker
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
