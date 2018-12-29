//
//  ViewController.swift
//  NagwaTask
//
//  Created by Nrmeen Tomoum on 12/28/18.
//  Copyright © 2018 Nagwa. All rights reserved.
//
import AlamofireObjectMapper
import Alamofire
import ObjectMapper
class GenericRequest
{    class   func requestGetMappable<T:Mappable>(URL : String,completionHandler: @escaping([T]?,errorMessage?,errorMessage? )-> Void)
    {
        self.genericRequestMappable(httpMethod: .get, urlParameters: nil, URL: URL, isWithToken: false)  { (result, storeError,servererror) in
            completionHandler(result,storeError,servererror)
        }
    }
     class    func genericRequestMappable<T: Mappable>(httpMethod : HTTPMethod ,urlParameters : [String : AnyObject]?,URL : String,isWithToken :Bool,completionHandler: @escaping([T]?,errorMessage?,errorMessage? )-> Void)
    {
        self.mainRequest(httpMethod: httpMethod, urlParameters: urlParameters, URL: URL, isWithToken: isWithToken){ (result:[T]?, error:errorMessage?) in
            if (result?.count)! > 0
            {
                    completionHandler(result!,nil,nil)
               }
            else {
                completionHandler(nil,nil,error)
            }
            
        }
    }
    
    class    func mainRequest<T:Mappable>(httpMethod : HTTPMethod ,urlParameters : [String : AnyObject]?,URL : String,isWithToken :Bool,completionHandler: @escaping ([T],errorMessage?) -> Void)
    {
        Alamofire.request(URL, method: httpMethod , parameters: urlParameters, encoding: JSONEncoding.default, headers: RequestComponent.headerComponent(requireAuthOrNot: isWithToken)).responseArray{(response: DataResponse<[T]>)  in
            let respons = response.result.value
       //     print("respons",respons?.payload as Any)
            switch response.result {
            case .success:
                completionHandler(respons!, nil)
            case .failure:
                completionHandler([],errorMessage(message:"Server Down"))
            }
            }    }
    
    }

