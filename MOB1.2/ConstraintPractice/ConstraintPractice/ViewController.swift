//
//  ViewController.swift
//  ConstraintPractice
//
//  Created by Wesley Espinoza on 10/27/18.
//  Copyright © 2018 HazeStudios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     var phase = 0
    let rView = UIViewController.viewFunc(.red)
    let bView = UIViewController.viewFunc(.blue)
    let makeSchoolText = UIViewController.TextFunc("Make School", .black, true)
    let johnDoeText = UIViewController.TextFunc("John Doe", .lightGray, false)

    override func viewDidLoad() {
        
       
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(rView)
        view.addSubview(bView)
        view.addSubview(makeSchoolText)
        view.addSubview(johnDoeText)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var rViewHeight = rView.heightAnchor.constraint(equalToConstant: CGFloat(view.bounds.height/2))
        var rViewLeading = rView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0)
        var rViewTrailing = rView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        var rViewTop = rView.topAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 0)
        
        
        var bViewHeight = bView.heightAnchor.constraint(equalToConstant: CGFloat(view.bounds.height/2))
        var bViewLeading = bView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0)
        var bViewTrailing = bView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        var bViewBottom = bView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        NSLayoutConstraint.activate([rViewTop, rViewTrailing, rViewLeading, rViewHeight, bViewBottom, bViewLeading, bViewTrailing, bViewHeight])
        print("touched")
        phase += 1
        
        print(phase)
        
        if phase > 5 {
            phase = 0
        }
        
        
        switch phase {
        case 1:
            rViewHeight = rView.heightAnchor.constraint(equalToConstant: CGFloat(view.bounds.height/2))
            rViewLeading = rView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0)
            rViewTrailing = rView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
            rViewTop = rView.topAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 0)
            
            
            bViewHeight = bView.heightAnchor.constraint(equalToConstant: CGFloat(view.bounds.height/2))
            bViewLeading = bView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0)
            bViewTrailing = bView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
            bViewBottom = bView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
            UIView.animate(withDuration: 2) {
                self.view.layoutIfNeeded()
            }
        case 2:
            rViewHeight = rView.heightAnchor.constraint(equalToConstant: CGFloat(view.bounds.height/2))
            rViewLeading = rView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0)
            rViewTrailing = rView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0 )
            rViewTop = rView.topAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 0)
            
            
            bViewHeight = bView.heightAnchor.constraint(equalToConstant: CGFloat(view.bounds.height/1.4))
            bViewLeading = bView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0)
            bViewTrailing = bView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
            bViewBottom = bView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
            
            
            UIView.animate(withDuration: 2) {
                self.view.layoutIfNeeded()
            }
            
        default:
            rViewHeight = rView.heightAnchor.constraint(equalToConstant: CGFloat(view.bounds.height/2))
            rViewLeading = rView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0)
            rViewTrailing = rView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
            rViewTop = rView.topAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 0)
            
            
            bViewHeight = bView.heightAnchor.constraint(equalToConstant: CGFloat(view.bounds.height/2))
            bViewLeading = bView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0)
            bViewTrailing = bView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
            bViewBottom = bView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        }
        
        NSLayoutConstraint.activate([rViewTop, rViewTrailing, rViewLeading, rViewHeight, bViewBottom, bViewLeading, bViewTrailing, bViewHeight])
        
    }


}

