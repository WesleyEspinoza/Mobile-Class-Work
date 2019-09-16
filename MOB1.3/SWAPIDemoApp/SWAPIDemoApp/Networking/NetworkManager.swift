//
//  NetworkManager.swift
//  SWAPIDemoApp
//
//  Created by Wesley Espinoza on 2/21/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//

import Foundation

struct NetworkManager {
    typealias CompletionHandler = (_ success:Bool, _ data:StarShipInfo) -> Void
    
    static func fetchStarShips(completionHandler: @escaping CompletionHandler){
        
        let session = URLSession(configuration: .default)
        let jsonURL = "https://swapi.co/api/people/"
        let request = URLRequest(url: URL(string: jsonURL)!)
        session.dataTask(with: request) { (data, res, err) in
            
            if let data = data {
                
                var flag = true // true if download succeed,false otherwise
                
                if err == nil {
                    flag = true
                } else {
                    flag = false
                }
                do {
                    let shipInfo = try JSONDecoder().decode(StarShipInfo.self, from: data)
                    completionHandler(flag, shipInfo)
                } catch {
                    print("Error is : \n\(error)")
                }
            }
            
            }.resume()
    }
}
