//
//  ViewController.swift
//  NagwaTask
//
//  Created by Nrmeen Tomoum on 12/28/18.
//  Copyright © 2018 Nagwa. All rights reserved.
//
import Foundation
import UIKit
var fromBrowseArtworks : Bool = false
class RequestComponent {
    
    class func headerComponent(requireAuthOrNot:Bool)->[String:String]{
//        let user = "admin@boot.com"
//        let password = "admin"
//        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
//        let base64Credentials = credentialData.base64EncodedString()
            
            //credentialData.base64EncodedStringWithOptions([])
       // let headers = ["Authorization": "Basic \(base64Credentials)"]
//
        var header = [
            "Content-Type":"application/json"]
       //  header["Authorization"] = "Basic \(base64Credentials)"
//        if requireAuthOrNot
//        {
//            header["Authorization"] = "Bearer " + ""
//        }
        return header
    }
 
    class func createRequestJson (_ keys:[String],values:[AnyObject])->NSDictionary{
        let requestDictionary = NSMutableDictionary()
        let dic = NSDictionary(objects: values, forKeys: keys as [NSCopying])
        
        for item in dic {
            requestDictionary.setObject(item.value, forKey: item.key as! String as NSCopying)
        }
        return requestDictionary
    }
}
struct Constants{
    struct ScreenSize
    {
        static var SCREEN_WIDTH = UIScreen.main.bounds.size.width
        
        static var SCREEN_HEIGHT = UIScreen.main.bounds.size.height
        static var SCREEN_HEIGHT_TAB_FONT = UIScreen.main.bounds.size.height*0.025
        static var SCREEN_HEIGHT_TEXTFILED_FONT = UIScreen.main.bounds.size.height*0.02
        static var SCREEN_HEIGHT_ARTBank_MedButton_FONT = UIScreen.main.bounds.size.height*0.02
        static var SCREEN_HEIGHT_ARTBank_MainButton_FONT = UIScreen.main.bounds.size.height*0.025
        
        static var SCREEN_HEIGHT_Menu_LABEL_FONT = SCREEN_HEIGHT_TEXTFILED_FONT
        static var SCREEN_HEIGHT_LABEL_FONT = SCREEN_HEIGHT_TEXTFILED_FONT*0.5
        
        static var SCREEN_HEIGHT_BUTTON_FONT = UIScreen.main.bounds.size.height*0.03
        static var SCREEN_reduce_BUTTON_FONT = UIScreen.main.bounds.size.height*0.025
        static var SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static var SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    }
    
    struct StoryBoardSegueIdentifiers {
        
        static let homeVC = "HomeVC"
    }
    

    static func imageNameForAllDevices (_ imageName: String) -> String
    {
        var backgroundImageName = ""
        
        if UIDevice().userInterfaceIdiom == .phone
        {
            switch UIScreen.main.bounds.height
            {
            case 812:   // 5.8" (iPhone X) (3x) (Portrait)
                backgroundImageName = imageName+"-1125h"
            case 736:  // 5.5" (iPhone 8+, 7+, 6s+, 6+) (3x) (Portrait)
                backgroundImageName =
                    imageName+"-736h@3x"
            case 414:  // 5.5" (iPhone 8+, 7+, 6s+, 6+) (3x) (Landscape)
                backgroundImageName = "background_2208x1242"
            case 667:  // 4.7" (iPhone 8, 7, 6s, 6) (2x) (Portrait)
                backgroundImageName = imageName+"-667h@2x"
            case 375:
                // 5.8" (iPhone X) (3x) (Landscape)
                if (UIScreen.main.bounds.width == 812) {
                    backgroundImageName = "background_2436x1125"
                }
                    // 4.7" (iPhone 8, 7, 6s, 6) (2x) (Landscape)
                else if (UIScreen.main.bounds.width == 667) {
                    backgroundImageName = "background_1334x750"
                }
            case 568:  // 4.0" (iPhone SE, 5s, 5c, 5) (2x) (Portrait)
                backgroundImageName = imageName+"@2x"
            case 320:  // 4.0" (iPhone SE, 5s, 5c, 5) (2x) (Landscape)
                backgroundImageName = "background_1136x640"
            default:
                break
            }
        }
        else if UIDevice().userInterfaceIdiom == .pad
        {
            switch UIScreen.main.bounds.height
            {
            case 1366:  // 12.9" (iPad Pro 12.9) (2x) (Portrait)
                backgroundImageName = imageName+"-portrait"
            case 1112:  // 10.5" (iPad Pro 10.5) (2x) (Portrait)
                backgroundImageName = imageName+"-portrait@2x"
            case 834:  // 10.5" (iPad Pro 10.5) (2x) (Landscape)
                backgroundImageName = "background_2224x1668"
            case 1024:
                // 12.9" (iPad Pro 12.9) (2x) (Landscape)
                if (UIScreen.main.bounds.width == 1366) {
                    backgroundImageName = "background_2732x2048"
                }
                    // 9.7" & 7.9" (iPad Pro 9.7, iPad Air 2, iPad Air, iPad 4, iPad 3, iPad Mini 4, iPad Mini 3, iPad Mini 2) (2x) (Portrait)
                else if (UIScreen.main.bounds.width == 1366) {
                    backgroundImageName = imageName+"-portrait@3x"
                }
            case 768:  // 9.7" & 7.9" (iPad Pro 9.7, iPad Air 2, iPad Air, iPad 4, iPad 3, iPad Mini 4, iPad Mini 3, iPad Mini 2) (2x) (Landscape)
                backgroundImageName = "background_2048x1536"
            default:
                break
            }
        }
        return backgroundImageName
    }
    
   
    struct StoryBoardIDs {
        static let HomeViewViewController = "HomeViewViewController"
    }
    
    struct Server{
        fileprivate static let hostUrl = "https://api.github.com/users/JeffreyWay/repos?"
        struct Services {
            static let  getRepositories =  hostUrl
        }
        
    }
    
}
