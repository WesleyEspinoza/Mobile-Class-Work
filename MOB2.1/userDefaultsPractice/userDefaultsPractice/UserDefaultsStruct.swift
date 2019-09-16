//
//  UserDefaultsStruct.swift
//  userDefaultsPractice
//
//  Created by Wesley Espinoza on 4/22/19.
//  Copyright © 2019 HazeStudio. All rights reserved.
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
        UserDefaults.standard.set(token, forKey: "savedToken")
    }
    
    static var getToken = { () -> Model in
        //complete the method
        return Model(token: UserDefaults.standard.string(forKey: "savedToken")!)
    }
    
    static func clearUserData(){
        //complete the method using removeObject
    }
}
