//
//  HomeModels.swift
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
import ObjectMapper
enum Home
{
    // MARK: Use cases
    
    enum Repository
    {
        struct Request
        {
            var page : Int
            var size : Int
        }
        struct  ViewModel
        {
            var id : Int
            var name : String
            var description : String
            var isLoadingMore : Bool
        }
        class  Response : Mappable {
            var id : Int?
            var name : String?
            var description : String?
            required init?(map: Map){
                
            }
            func mapping(map: Map) {
                id <- map["id"]
                name <- map ["name"]
                description <- map["description"]
                
            }
        }
    }
}
