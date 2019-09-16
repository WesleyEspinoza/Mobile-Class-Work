//
//  MoodEntryTableViewCell.swift
//  MoodTracker
//
//  Created by Wesley Espinoza on 12/9/18.
//  Copyright © 2018 HazeStudios. All rights reserved.
//

import Foundation
import UIKit

class MoodEntryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelMoodTitle: UILabel!
    
    
    @IBOutlet weak var labelMoodDate: UILabel!
    
    @IBOutlet weak var imageViewMoodColor: UIImageView!
    
    
    func configure(_ entry: MoodEntry) {
        imageViewMoodColor.backgroundColor = entry.mood.colorValue
        labelMoodTitle.text = entry.mood.stringValue
        labelMoodDate.text = entry.date.stringValue
    }
    
    
}
