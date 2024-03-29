//
//  SecondViewController.swift
//  DelegateDemo
//
//  Created by Adriana González Martínez on 1/7/19.
//  Copyright © 2019 Adriana González Martínez. All rights reserved.
//

import UIKit

// Step 1: Adding protocol

protocol bgColorDelegate {
    func switchColor(color: UIColor)
}


class SecondViewController: UIViewController {

    @IBOutlet weak var firstOption: ColorView!
    @IBOutlet weak var secondOption: ColorView!
    @IBOutlet weak var thirdOption: ColorView!
    var delegate: bgColorDelegate?
    
    //Step 2: Creating a delegate property.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstOption.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:))))
        secondOption.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:))))
        thirdOption.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:))))

    }

    @objc func viewTapped(_ tapGesture: UITapGestureRecognizer) {
        //Step 3: Adding the delegate method call
        let circle = tapGesture.view as? ColorView
        if self.delegate != nil {
            self.delegate?.switchColor(color: (circle?.mainColor)!)
        }
        self.dismiss(animated: true)
    }
    
    
    
}
