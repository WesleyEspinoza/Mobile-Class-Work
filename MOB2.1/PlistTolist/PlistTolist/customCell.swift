//
//  customCell.swift
//  PlistTolist
//
//  Created by Wesley Espinoza on 4/16/19.
//  Copyright © 2019 HazeStudio. All rights reserved.
//

import Foundation
import UIKit

class customCell: UITableViewCell {
    static let reUseId = "customCell"
    var mainLabel: UILabel
    var scoreLabel: UILabel
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        mainLabel = UILabel()
        scoreLabel = UILabel()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(mainLabel)
        self.addSubview(scoreLabel)
        
        
        mainLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        mainLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        scoreLabel.trailingAnchor.constraint(equalTo: mainLabel.leadingAnchor, constant: -15).isActive = true
        scoreLabel.topAnchor.constraint(equalTo: mainLabel.topAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
