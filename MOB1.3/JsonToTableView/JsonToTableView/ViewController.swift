//
//  ViewController.swift
//  JsonToTableView
//
//  Created by Wesley Espinoza on 2/9/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tableView: UITableView!
    let cellId = "MainCell"
    var concertList = [Concerts]()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseJson()
        
        
        configureTableView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func parseJson(){
        let path = Bundle.main.path(forResource: "data", ofType: ".json")
        if let path = path {
            let url = URL(fileURLWithPath: path)
            let contents = try? Data(contentsOf: url, options: .alwaysMapped)
            do {
                let concerts = try JSONDecoder().decode([Concerts].self, from: contents!)
                for concert in concerts{
                    concertList.append(concert)
                    print(concert.lineUp!)
                }
            } catch {
                //handle error
                print(error)
            }
        }
    }

    func configureTableView(){
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .singleLine
        tableView.sizeToFit()
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
    }
    
    
}

struct Concerts: Decodable {
    let name: String?
    let type: String?
    let date: String?
    let city: [String: String]?
    let lineUp: [LineUp]?
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case type = "type"
        case date = "date"
        case city = "city"
        case lineUp = "lineup"
    }
}

struct LineUp: Decodable {
    let name: String?
    let id: String?
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case id = "id"
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return concertList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! MainTableViewCell
        cell.concertLabel.text = concertList[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var city = ""
        guard let type = concertList[indexPath.row].type else {return}
        guard let date = concertList[indexPath.row].date else {return}
        guard let cityDict = concertList[indexPath.row].city else {return}
        for (key, value) in cityDict {
            if key == "name"{
                city = value
            }
        }
        
        
        
        
        let alert = UIAlertController(title: concertList[indexPath.row].name, message:
"""
        Date: \(date)
City: \(city)
            Concert Type: \(type)
""", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "See the Lineup", style: .default, handler: { action in
            print("TODO Show LineUp View")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

