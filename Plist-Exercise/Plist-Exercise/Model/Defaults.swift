//
//  Defaults.swift
//  Plist-Exercise
//
//  Created by Ryan Nguyen on 4/4/19.
//  Copyright © 2019 Danh Phu Nguyen. All rights reserved.
//

import Foundation

struct Defaults {
    
    static let token = "token"
    static let tokenKey = "tokenKey"
    
    struct Model {
        var token: String?
        
        init(token: String) {
            //complete the initializer
            self.token = token
        }
    }
    
    static var saveToken = { (token: String) in
        //complete the method
        UserDefaults.standard.set(token, forKey: tokenKey)
    }
    
    static var getToken = { () -> Model in
        //complete the method
        return Model(token: UserDefaults.standard.string(forKey: tokenKey) ?? "No Token Found")
    }
    
    static func clearUserData(){
        //complete the method using removeObject
        UserDefaults.standard.removeObject(forKey: tokenKey)
    }
}
