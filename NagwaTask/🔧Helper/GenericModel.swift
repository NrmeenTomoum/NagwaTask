//
//  ViewController.swift
//  NagwaTask
//
//  Created by Nrmeen Tomoum on 12/28/18.
//  Copyright © 2018 Nagwa. All rights reserved.
//
import Foundation
import ObjectMapper

//class BoolMappable : Mappable
//{
//    var flage :Bool?
//    
//    required init?(map: Map){
//        
//    }
//   
//    func mapping(map: Map) {
//        flage <- map ["Result"]
//    }
//    
//}
//
//class StringMappable : Mappable
//{
//    var sString :String?
//    
//    required init?(map: Map){
//        
//    }
//    
//    func mapping(map: Map) {
//        sString <- map ["Result"]
//    }
//}

struct  errorMessage
{
    var message : String
}
class ResponseMappable <T:Mappable> : Mappable
{
    var Status : Int?
    var Message : String?
    var IsError : Bool?
    var Error : String?
    var Result : T?
    var CurrentVersion : String?
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        Status <- map["Status"]
        Message <- map["Message"]
        IsError <- map["IsError"]
        Error <- map["Error"]
        Result <- map["Result"]
        CurrentVersion <- map["CurrentVersion"]
    }
    
}

class Response <T> : Mappable
{
    var Status : Int?
    var Message : String?
    var IsError : Bool?
    var Error : String?
    var Result : T?
    var CurrentVersion : String?
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        Status <- map["Status"]
        Message <- map["Message"]
        IsError <- map["IsError"]
        Error <- map["Error"]
        Result <- map["Result"]
        CurrentVersion <- map["CurrentVersion"]
    }
    
}

class ResponseMappableArray <T:Mappable> : Mappable
{
    var Status : Int?
    var Message : String?
    var IsError : Bool?
    var Error : String?
    var Result :  [T]?
    var CurrentVersion : String?
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        Status <- map["Status"]
        Message <- map["Message"]
        IsError <- map["IsError"]
        Error <- map["Error"]
        Result <- map["Result"]
        CurrentVersion <- map["CurrentVersion"]
    }
    
}

class ResponseData : Mappable
{
    
    var IsError : Bool?
    var Error : String?
//    var Result : ArtworkLookUpData?
    var CurrentVersion : String?
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        IsError <- map["IsError"]
        Error <- map["Error"]
       // Result <- map["Result"]
        CurrentVersion <- map["CurrentVersion"]
    }
    
}
