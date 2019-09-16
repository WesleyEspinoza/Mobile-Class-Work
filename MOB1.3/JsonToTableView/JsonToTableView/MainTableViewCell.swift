//
//  MainTableViewCell.swift
//  JsonToTableView
//
//  Created by Wesley Espinoza on 2/9/19.
//  Copyright © 2019 ErespiStudios. All rights reserved.
//

import Foundation
import UIKit

class MainTableViewCell: UITableViewCell {
    static let reUseId = "MainCell"
    var concertLabel: UILabel
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        concertLabel = UILabel()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        concertLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(concertLabel)
        
        
        concertLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        concertLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
