//
//  ViewController.swift
//  SWAPIDemoApp
//
//  Created by Wesley Espinoza on 2/18/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var starShips: StarShipInfo! {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        // Do any additional setup after loading the view, typically from a nib.
        configureTableView()
        
    }
    
    func configureTableView(){
        tableView = UITableView(frame: UIScreen.main.bounds)
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(Cell.self, forCellReuseIdentifier: Cell.cellId)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func fetchData(){
        NetworkManager.fetchStarShips { (success, data) in
            if success {
                self.starShips = data
            }
        }
    }
    
 

    
    func fetchPeopl(){
        
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let starShips = starShips else  {return 1}
       
        return starShips.results!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.cellId, for: indexPath) as! Cell
        if (starShips != nil) {
            cell.mainLable.text = starShips.results![indexPath.row].name
        }
        return cell
    }
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if indexPath.row = (starShips!.results?.count)! - 1 {
//
//        }
//    }
//
//
}


struct StarShipInfo: Decodable{
    let count: Int?
    let results: [StarShips]?
    
    private enum codingKeys: String, CodingKey{
        
        case count = "count"
        case results = "results"
    }
}

struct StarShips: Decodable {
    let name: String?
    let model: String?
    
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case model = "model"
    }
}

