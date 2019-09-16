//
//  Cell.swift
//  SWAPIDemoApp
//
//  Created by Wesley Espinoza on 2/18/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//

import Foundation
import UIKit

class Cell: UITableViewCell{
    public static let cellId = "ReUseId"
    var mainLable: UILabel! = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        mainLable.translatesAutoresizingMaskIntoConstraints = false
        mainLable.text = "Error getting Text"
        self.addSubview(mainLable)
        
        
        mainLable.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor, constant: 0).isActive = true
        mainLable.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: 0).isActive = true    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

