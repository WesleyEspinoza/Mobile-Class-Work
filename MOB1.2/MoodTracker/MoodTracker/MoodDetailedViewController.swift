//
//  MoodDetailedViewController.swift
//  MoodTracker
//
//  Created by Wesley Espinoza on 12/9/18.
//  Copyright © 2018 HazeStudios. All rights reserved.
//

import Foundation
import UIKit

class MoodDetailedViewController: UIViewController {
    var isEditingEntry = false
    var date: Date!
    var mood: MoodEntry.Mood!
    @IBOutlet weak var amazingButton: UIButton!
    @IBOutlet weak var goodButton: UIButton!
    @IBOutlet weak var neutralButton: UIButton!
    @IBOutlet weak var badButton: UIButton!
    @IBOutlet weak var terribleButton: UIButton!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var moodDetailDatePicker: UIDatePicker!
    
    private func updateUI() {
        updateMood(to: mood)
        moodDetailDatePicker.date = date
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        print(date, mood)
    }
    @IBAction func pressMood(_ button: UIButton) {
        switch button.tag {
        case 0:
            updateMood(to: .amazing)
        case 1:
            updateMood(to: .good)
        case 2:
            updateMood(to: .neutral)
        case 3:
            updateMood(to: .bad)
        case 4:
            updateMood(to: .terrible)
        default:
            
            //NOTE: error handling
            print("unhandled button tag")
        }
    }
    
    
    @IBAction func saveButtonAction(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "unwind from save", sender: nil)
       
    }
    
    
    @IBAction func datePickerDidChangeValue(_ sender: Any) {
        date = moodDetailDatePicker.date
    }
    
    
    
    private func updateMood(to newMood: MoodEntry.Mood) {
        let unselectedColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        switch newMood {
        case .none:
            amazingButton.backgroundColor = unselectedColor
            goodButton.backgroundColor = unselectedColor
            neutralButton.backgroundColor = unselectedColor
            badButton.backgroundColor = unselectedColor
            terribleButton.backgroundColor = unselectedColor
        case .amazing:
            amazingButton.setTitleColor(.white, for: .normal)
            amazingButton.backgroundColor = newMood.colorValue
            goodButton.backgroundColor = unselectedColor
            neutralButton.backgroundColor = unselectedColor
            badButton.backgroundColor = unselectedColor
            terribleButton.backgroundColor = unselectedColor
            
            goodButton.setTitleColor(.blue, for: .normal)
            neutralButton.setTitleColor(.gray, for: .normal)
            badButton.setTitleColor(.orange, for: .normal)
            terribleButton.setTitleColor(.red, for: .normal)
        case .good:
            amazingButton.backgroundColor = unselectedColor
            goodButton.backgroundColor = newMood.colorValue
            goodButton.setTitleColor(.white, for: .normal)
            neutralButton.backgroundColor = unselectedColor
            badButton.backgroundColor = unselectedColor
            terribleButton.backgroundColor = unselectedColor
            
            amazingButton.setTitleColor(.green, for: .normal)
            neutralButton.setTitleColor(.gray, for: .normal)
            badButton.setTitleColor(.orange, for: .normal)
            terribleButton.setTitleColor(.red, for: .normal)
        case .neutral:
            amazingButton.backgroundColor = unselectedColor
            goodButton.backgroundColor = unselectedColor
            neutralButton.backgroundColor = newMood.colorValue
            neutralButton.setTitleColor(.white, for: .normal)
            badButton.backgroundColor = unselectedColor
            terribleButton.backgroundColor = unselectedColor
            
            amazingButton.setTitleColor(.green, for: .normal)
            goodButton.setTitleColor(.blue, for: .normal)
            badButton.setTitleColor(.orange, for: .normal)
            terribleButton.setTitleColor(.red, for: .normal)
        case .bad:
            amazingButton.backgroundColor = unselectedColor
            goodButton.backgroundColor = unselectedColor
            neutralButton.backgroundColor = unselectedColor
            badButton.backgroundColor = newMood.colorValue
            badButton.setTitleColor(.white, for: .normal)
            terribleButton.backgroundColor = unselectedColor
            
            amazingButton.setTitleColor(.green, for: .normal)
            goodButton.setTitleColor(.blue, for: .normal)
            neutralButton.setTitleColor(.gray, for: .normal)
            terribleButton.setTitleColor(.red, for: .normal)
        case .terrible:
            amazingButton.backgroundColor = unselectedColor
            goodButton.backgroundColor = unselectedColor
            neutralButton.backgroundColor = unselectedColor
            badButton.backgroundColor = unselectedColor
            terribleButton.backgroundColor = newMood.colorValue
            
            amazingButton.setTitleColor(.green, for: .normal)
            goodButton.setTitleColor(.blue, for: .normal)
            neutralButton.setTitleColor(.gray, for: .normal)
            badButton.setTitleColor(.orange, for: .normal)
            terribleButton.setTitleColor(.white, for: .normal)
        }
        
        mood = newMood
    }
    @IBAction func AmazingButtonAction(_ sender: UIButton) {
        pressMood(sender)
    }
    @IBAction func GoodButtonAction(_ sender: UIButton) {
        pressMood(sender)
    }
    @IBAction func NeutralButtonAction(_ sender: UIButton) {
        pressMood(sender)
    }
    @IBAction func BadButtonAction(_ sender: UIButton) {
        pressMood(sender)
    }
    @IBAction func TerribleButtonAction(_ sender: UIButton) {
        pressMood(sender)
    }
    
}
