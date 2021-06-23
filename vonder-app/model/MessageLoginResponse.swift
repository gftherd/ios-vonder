//
//  MessageLoginResponse.swift
//  vonder-app
//
//  Created by golf on 12/6/2564 BE.
//

import Foundation

class MessageLoginResponse {
    var _id : String?
    var token : String?
    var error : String?


    init() {
        
    }


    init(_id : String,token : String  , error : String){
        self._id = _id
        self.token = token
        self.error = error
        
    }
}


