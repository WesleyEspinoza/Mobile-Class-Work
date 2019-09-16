//
//  HabitTableViewCell.swift
//  Habitual
//
//  Created by Wesley Espinoza on 12/15/18.
//  Copyright © 2018 HazeStudios. All rights reserved.
//

import UIKit

class HabitTableViewCell: UITableViewCell {
    @IBOutlet weak var imageViewIcon: UIImageView!
    @IBOutlet weak var lableHabitTracker: UILabel!
    @IBOutlet weak var lableStreaks: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    static let identifier = "habit cell"
    
    // Returning the xib file after instantiating it
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ habit: Habit) {
        self.imageViewIcon.image = habit.selectedImage.image
        self.lableHabitTracker.text = habit.title
        self.lableStreaks.text = "streak: \(habit.currentStreak)"
        
        if habit.hasCompletedForToday {
            self.accessoryType = .checkmark
        } else {
            self.accessoryType = .disclosureIndicator
        }
    }

    
}
