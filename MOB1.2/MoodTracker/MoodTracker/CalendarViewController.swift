//
//  CalendarViewController.swift
//  MoodTracker
//
//  Created by Wesley Espinoza on 12/14/18.
//  Copyright © 2018 HazeStudios. All rights reserved.
//

import Foundation
import UIKit


class CalendarViewController: UIViewController{
        @IBAction func pressDone(_ sender: UIButton) {
            presentingViewController?.dismiss(animated: true, completion: nil)
        }
    
    
}
