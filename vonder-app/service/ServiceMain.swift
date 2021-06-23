//
//  ServiceMain.swift
//  vonder-app
//
//  Created by golf on 12/6/2564 BE.
//

import UIKit
import Alamofire
import SwiftyJSON


class ServiceMain {
    
    static func callLogin (param : [String: Any], completion: @escaping (MessageLoginResponse? , Error?) -> ()){
        AF.request("https://portal-dev.vonder.co.th/auth-adapter/public/enduser/login" ,
                                  method: .post,
                                  parameters: param,
                                  encoding: JSONEncoding.default
                    )
                    .validate(statusCode: 200..<600)
                    .responseJSON { response in
                        switch response.result {
                            case .success(let value):
                                let json = JSON(value)
                                let id =  json["_id"].string
                                let token =  json["token"].string
                                completion(MessageLoginResponse(_id : id ?? "" , token : token ?? "" , error : "" ),nil)
                             break
                            case .failure(_):
                                if let data = response.data {
                                completion(MessageLoginResponse(_id : "" , token : "" ,error :
                                                                    String(data: data, encoding: String.Encoding.utf8)!),nil)
                                }
                            break
                        }
                       
                    }
    }
    
    
    
    static func callRegister (param : [String: Any], completion: @escaping (MessageLoginResponse? , Error?) -> ()){
        AF.request("https://portal-dev.vonder.co.th/auth-adapter/public/enduser/register" ,
                                  method: .post,
                                  parameters: param,
                                  encoding: JSONEncoding.default
                    )
                    .validate(statusCode: 200..<600)
                    .responseJSON { response in
                        switch response.result {
                            case .success(let value):
                                completion(MessageLoginResponse(_id : "" , token : "" , error : "" ),nil)
                            break
                            case .failure(_):
                                if let data = response.data {
                                    completion(MessageLoginResponse(_id : "" , token : "" ,error :
                                                                String(data: data, encoding: String.Encoding.utf8)!),nil)
                                    }
                            break
                        }
                       
                    }
    }
    
    
    
    static func callVerifyOTP (param : [String: Any], completion: @escaping (MessageLoginResponse? , Error?) -> ()){
        AF.request("https://portal-dev.vonder.co.th/auth-adapter/submit/otp/verify" ,
                                  method: .post,
                                  parameters: param,
                                  encoding: JSONEncoding.default
                    )
                    .validate(statusCode: 200..<600)
                    .responseJSON { response in
                        switch response.result {
                        case .success(let value):
                            let json = JSON(value)
                            let id =  json["_id"].string
                            completion(MessageLoginResponse(_id : id ?? "" , token :  "" , error : "" ),nil)
                         break
                        case .failure(_):
                            if let data = response.data {
                            completion(MessageLoginResponse(_id : "" , token : "" ,error :
                                                                String(data: data, encoding: String.Encoding.utf8)!),nil)
                            }
                        break
                        }
                       
                    }
    }
    
    
    
    static func callResendOTP (param : [String: Any], completion: @escaping (MessageLoginResponse? , Error?) -> ()){
        AF.request("https://portal-dev.vonder.co.th/auth-adapter/public/resend/otp" ,
                                  method: .post,
                                  parameters: param,
                                  encoding: JSONEncoding.default
                    )
                    .validate(statusCode: 200..<600)
                    .responseJSON { response in
                        switch response.result {
                        case .success(let value):
                            completion(MessageLoginResponse(_id : "" , token : "" , error : "" ),nil)
                         break
                        case .failure(_):
                        if let data = response.data {
                            print("error : " , String(data: data, encoding: String.Encoding.utf8))
                            completion(MessageLoginResponse(_id : "" , token : "" ,error :
                                                                String(data: data, encoding: String.Encoding.utf8)!),nil)
                            }
                        break
                        }
                       
                    }
    }
}
