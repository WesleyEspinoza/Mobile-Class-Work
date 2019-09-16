//
//  ViewController.swift
//  KeyChainDemo
//
//  Created by Wesley Espinoza on 5/2/19.
//  Copyright © 2019 HazeStudio. All rights reserved.
//

import UIKit
import Foundation
import KeychainSwift

class ViewController: UIViewController {
    let keyChain = KeychainSwift()
    @IBOutlet weak var mainTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var previousMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        keyChain.synchronizable = true
        
        previousMessage.text = keyChain.get("savedText") ?? "no previous text"
    }
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        if keyChain.synchronizable {
            keyChain.set(mainTextView.text!, forKey: "savedText")
            if keyChain.lastResultCode != noErr { print(noErr) }
        } else {
            let alert = UIAlertController(title: "Error", message: "This demo is for testing sync so try activating the switch first", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
        
        previousMessage.text = keyChain.get("savedText")
        print("shit")
        
    }
    
    @IBAction func switchPressed(_ sender: Any) {
        if keyChain.synchronizable{
            keyChain.synchronizable = false
        } else {
            keyChain.synchronizable = true
        }
    }
    @IBAction func deletePressed(_ sender: Any) {
        keyChain.delete("savedText")
    }
    
}

