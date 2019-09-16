//
//  ViewController.swift
//  userDefaultsPractice
//
//  Created by Wesley Espinoza on 4/22/19.
//  Copyright © 2019 HazeStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Defaults.saveToken("RandomTokenHERE")
        
        let obj =  Defaults.getToken()
        
        print(obj.token!)
        
        }


}

