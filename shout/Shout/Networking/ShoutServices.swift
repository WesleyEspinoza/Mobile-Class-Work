//
//  ShoutServices.swift
//  Shout
//
//  Created by Wesley Espinoza on 11/20/18.
//  Copyright © 2018 HazeStudios. All rights reserved.
//

import Foundation

struct ShoutServices {
    static func makeRequest(_ completionHandler: @escaping([Shout]) ->()){
        let IOSEndpoint = URL(string: "https://radiant-stream-91625.herokuapp.com/IOS-shouts/")
        guard let unwrappedUrl = IOSEndpoint else {return}
        let request: URLRequest = URLRequest(url: unwrappedUrl)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error == nil{
                guard let response = response as? HTTPURLResponse else {return}
                
                switch response.statusCode{
                    
                case 200:
                    let shouts = try? JSONDecoder().decode([Shout].self, from: data!)
                    completionHandler(shouts!)
                default:
                    print(error as Any)
                }
            }else{
                print(error as Any)
            }
        }
        task.resume()
        
    }
    
}
