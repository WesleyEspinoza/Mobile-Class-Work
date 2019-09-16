//
//  ViewController.swift
//  PlistTolist
//
//  Created by Wesley Espinoza on 4/8/19.
//  Copyright © 2019 HazeStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var array: plistThing!
    let tableView: UITableView = {
       let table = UITableView(frame: UIScreen.main.bounds)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(customCell.self, forCellReuseIdentifier: customCell.reUseId)
        // Do any additional setup after loading the view.
        let path = Bundle.main.path(forResource: "samplePlist", ofType: "plist")!
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            array = try decoder.decode(plistThing.self, from: data)
        } catch {
            // Handle error
            print(error)
        }
        
        print(array.scores)
        
        view.addSubview(tableView)
        
    }

}

extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.scores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: customCell.reUseId, for: indexPath) as! customCell
       cell.mainLabel.text = array.scores[indexPath.row]["Name"]
        cell.scoreLabel.text = array.scores[indexPath.row]["Score"]
        return cell
    }
}


struct plistThing: Codable {
    var firstTime: Bool
    var welcomeMessage: String
    var preferredNumber: Int
    var scores: [[String:String]]
    
    private enum CodingKeys: String, CodingKey {
        case firstTime = "firstTime"
        case welcomeMessage = "welcomeMessage"
        case preferredNumber = "preferredNumber"
        case scores = "Scores"
    }
}


