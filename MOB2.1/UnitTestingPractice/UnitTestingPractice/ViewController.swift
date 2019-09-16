//
//  ViewController.swift
//  UnitTestingPractice
//
//  Created by Wesley Espinoza on 4/22/19.
//  Copyright © 2019 HazeStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(self.makeTitle(string: "TEStingTEs"))
    }
    //First function
    func vowelsInAString(string: String) -> Int {
        let vowels: [Character] = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
        var numberOfVowels = 0
        for character in string {
            if vowels.contains(character) {
                numberOfVowels +=  1
            }
        }
        return numberOfVowels
    }
    
    func makeTitle(string: String) -> String {
        let words = string.components(separatedBy: " ")
        
        var headline = ""
        for var word in words {
            let firstCharacter = word.remove(at:word.startIndex)
            headline += "\(String(firstCharacter).uppercased())\(word)"
        }
        return String(headline)
    }
    

}

