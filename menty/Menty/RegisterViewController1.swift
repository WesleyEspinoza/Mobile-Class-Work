//
//  RegisterViewController1.swift
//  Menty
//
//  Created by Wesley Espinoza on 10/15/18.
//  Copyright © 2018 HazeStudios. All rights reserved.
//

import Foundation
import UIKit

class RegisterViewController1: UIViewController{
    let gradient = CAGradientLayer()
    var gradientSet = [[CGColor]]()
    var currentGradient: Int = 0
    
    
    let gradientOne = UIColor(red: 48/255, green: 62/255, blue: 103/255, alpha: 1).cgColor
    let gradientTwo = UIColor(red: 244/255, green: 88/255, blue: 53/255, alpha: 1).cgColor
    let gradientThree = UIColor(red: 196/255, green: 70/255, blue: 107/255, alpha: 1).cgColor
    //initializes the log in button
    
    var continueButton = Utilities.Button(title: "Continue")
    var cancelButton = Utilities.Button(title: "Cancel")
    
    //initializes the register button

    //initializes the logo
    
    var logo = Utilities.image(name: "MentyLogoMini")
    
    //initializes the textfields
    
    var nameTB = Utilities.TextBox(placeHolder: "Name", leftViewImage: "icons8-person")
    var nameTBL = Utilities.line()
    var emailTB = Utilities.TextBox(placeHolder: "Email", leftViewImage: "icons8-send_mass_email")
    var emailTBL = Utilities.line()
    var passwordTB = Utilities.TextBox(placeHolder: "Password", leftViewImage: "icons8-password")
    var passwordTBL = Utilities.line()
    var phoneNumberTB = Utilities.TextBox(placeHolder: "PhoneNumber", leftViewImage: "icons8-phone")
    var phoneNumberTBL = Utilities.line()
    
    
    override func viewWillAppear(_ animated: Bool) {
        passwordTB.isSecureTextEntry = true
        phoneNumberTB.keyboardType = .numberPad
        emailTB.keyboardType = .emailAddress
        cancelButton.addTarget(self, action: #selector(CancelView), for: .touchUpInside)
        super.viewWillAppear(true)

        // Do any additional setup after loading the view, typically from a nib.
        //adds eveything to the view
        view.addSubview(logo)
        view.addSubview(nameTB)
        view.addSubview(nameTBL)
        view.addSubview(emailTB)
        view.addSubview(emailTBL)
        view.addSubview(passwordTB)
        view.addSubview(passwordTBL)
        view.addSubview(phoneNumberTB)
        view.addSubview(phoneNumberTBL)
        view.addSubview(continueButton)
        view.addSubview(cancelButton)
        
        
        //set the contraints to all of the objects
        NSLayoutConstraint.activate([
            continueButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:  -125),
            continueButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 125),
            continueButton.topAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 600),
            continueButton.heightAnchor.constraint(equalToConstant: 40),
            
            
            cancelButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:  -125),
            cancelButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 125),
            cancelButton.topAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 650),
            cancelButton.heightAnchor.constraint(equalToConstant: 40),
            
            
            logo.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -300),
            logo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            logo.topAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            logo.heightAnchor.constraint(equalToConstant: 75),
            
            
            nameTB.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:  -100),
            nameTB.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            nameTB.topAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            
            nameTBL.trailingAnchor.constraint(equalTo: nameTB.safeAreaLayoutGuide.trailingAnchor, constant:  0),
            nameTBL.leadingAnchor.constraint(equalTo: nameTB.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            nameTBL.topAnchor.constraint(lessThanOrEqualTo: nameTB.safeAreaLayoutGuide.bottomAnchor, constant: 2),
            nameTBL.heightAnchor.constraint(equalToConstant: 1),
            
            emailTB.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:  -100),
            emailTB.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            emailTB.topAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 275),
            
            emailTBL.trailingAnchor.constraint(equalTo: emailTB.safeAreaLayoutGuide.trailingAnchor, constant:  0),
            emailTBL.leadingAnchor.constraint(equalTo: emailTB.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            emailTBL.topAnchor.constraint(lessThanOrEqualTo: emailTB.safeAreaLayoutGuide.bottomAnchor, constant: 2),
            emailTBL.heightAnchor.constraint(equalToConstant: 1),
            
            passwordTB.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:  -100),
            passwordTB.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            passwordTB.topAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 350),
            
            passwordTBL.trailingAnchor.constraint(equalTo: passwordTB.safeAreaLayoutGuide.trailingAnchor, constant:  0),
            passwordTBL.leadingAnchor.constraint(equalTo: passwordTB.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            passwordTBL.topAnchor.constraint(lessThanOrEqualTo: passwordTB.safeAreaLayoutGuide.bottomAnchor, constant: 2),
            passwordTBL.heightAnchor.constraint(equalToConstant: 1),
            
            phoneNumberTB.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:  -100),
            phoneNumberTB.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            phoneNumberTB.topAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 425),
            
            phoneNumberTBL.trailingAnchor.constraint(equalTo: phoneNumberTB.safeAreaLayoutGuide.trailingAnchor, constant:  0),
            phoneNumberTBL.leadingAnchor.constraint(equalTo: phoneNumberTB.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            phoneNumberTBL.topAnchor.constraint(lessThanOrEqualTo: phoneNumberTB.safeAreaLayoutGuide.bottomAnchor, constant: 2),
            phoneNumberTBL.heightAnchor.constraint(equalToConstant: 1),
            
            
            ])
        
    }

    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // A Basic Implementation
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [
            UIColor(red: 48/255, green: 62/255, blue: 103/255, alpha: 1).cgColor,
            UIColor(red: 244/255, green: 88/255, blue: 53/255, alpha: 1).cgColor
        ]
        gradient.startPoint = CGPoint(x:0, y:0)
        gradient.endPoint = CGPoint(x:1, y:1)
        self.view.layer.addSublayer(gradient)
        
//        view.bringSubviewToFront(logInButton)
        view.bringSubviewToFront(continueButton)
        view.bringSubviewToFront(cancelButton)
        view.bringSubviewToFront(logo)
        view.bringSubviewToFront(nameTB)
        view.bringSubviewToFront(nameTBL)
        view.bringSubviewToFront(emailTB)
        view.bringSubviewToFront(emailTBL)
        view.bringSubviewToFront(passwordTB)
        view.bringSubviewToFront(passwordTBL)
        view.bringSubviewToFront(phoneNumberTB)
        view.bringSubviewToFront(phoneNumberTBL)
        
    }
    @objc func CancelView(){
        self.navigationController?.popViewController(animated: true)
    }
}
