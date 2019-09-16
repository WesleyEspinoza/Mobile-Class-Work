
//
//  Utilities.swift
//  Menty
//
//  Created by Wesley Espinoza on 10/16/18.
//  Copyright © 2018 HazeStudios. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    public static func viewFunc( _ color: UIColor) -> UIView {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = color
        return line
    }
    
    public static func TextFunc( _ text: String, _ color: UIColor, _ isBold : Bool) -> UILabel {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = text
        lable.textColor = color
        if isBold == true{
            lable.font = UIFont.boldSystemFont(ofSize: 12.0)
        }
        return lable
    }
}


