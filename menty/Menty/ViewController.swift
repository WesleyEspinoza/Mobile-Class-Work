//
//  ViewController.swift
//  Menty
//
//  Created by Wesley Espinoza on 10/14/18.
//  Copyright © 2018 HazeStudios. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn


class ViewController: UIViewController,
UIViewControllerTransitioningDelegate, UINavigationControllerDelegate, GIDSignInUIDelegate {
    let gradient = CAGradientLayer()
    var gradientSet = [[CGColor]]()
    var currentGradient: Int = 0

    let gradientOne = UIColor(red: 48/255, green: 62/255, blue: 103/255, alpha: 1).cgColor
    let gradientTwo = UIColor(red: 244/255, green: 88/255, blue: 53/255, alpha: 1).cgColor
    let gradientThree = UIColor(red: 196/255, green: 70/255, blue: 107/255, alpha: 1).cgColor
    
    let simpleOver = SimpleOver()
    
    var handle: AuthStateDidChangeListenerHandle?
    //initializes the log in button
    
    var logInButton: UIButton = Utilities.Button(title: "Log In")
    //initializes the register button
    
    var registerButton: UIButton = Utilities.Button(title: "Register")
    
    
    var googleButton: GIDSignInButton = {
        let button = GIDSignInButton()
        button.translatesAutoresizingMaskIntoConstraints = false       
        return button
    }()
    //initializes the logo
    
    var logo = Utilities.image(name: "MentyLogo")
    var line = Utilities.line()
    var line2 = Utilities.line()
    
    //initializes the username textfield
    var usernameTextBox = Utilities.TextBox(placeHolder: "UserName or Email", leftViewImage: "icons8-send_mass_email")
    //initializes the password textfield
    
    var passwordTextBox = Utilities.TextBox(placeHolder: "Password", leftViewImage: "icons8-password")
    
    
    override func viewDidLoad() {
        registerButton.addTarget(self, action: #selector(registerView), for: .touchUpInside)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //adds eveything to the view
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signInSilently()
        view.addSubview(logInButton)
        view.addSubview(registerButton)
        view.addSubview(googleButton)
        view.addSubview(logo)
        view.addSubview(usernameTextBox)
        view.addSubview(passwordTextBox)
        view.addSubview(line)
        view.addSubview(line2)
        
        //set the contraints to all of the objects
        NSLayoutConstraint.activate([
            usernameTextBox.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:  -50),
            usernameTextBox.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            usernameTextBox.topAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 400),
            usernameTextBox.heightAnchor.constraint(equalToConstant: 40),
            
            
            line.trailingAnchor.constraint(equalTo: usernameTextBox.safeAreaLayoutGuide.trailingAnchor, constant:  10),
            line.leadingAnchor.constraint(equalTo: usernameTextBox.safeAreaLayoutGuide.leadingAnchor, constant: -10),
            line.topAnchor.constraint(lessThanOrEqualTo: usernameTextBox.safeAreaLayoutGuide.bottomAnchor, constant: 1),
            line.heightAnchor.constraint(equalToConstant: 1),
            
            
            passwordTextBox.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:  -50),
            passwordTextBox.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            passwordTextBox.topAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 460),
            passwordTextBox.heightAnchor.constraint(equalToConstant: 40),
            
            
            line2.trailingAnchor.constraint(equalTo: passwordTextBox.safeAreaLayoutGuide.trailingAnchor, constant:  10),
            line2.leadingAnchor.constraint(equalTo: passwordTextBox.safeAreaLayoutGuide.leadingAnchor, constant: -10),
            line2.topAnchor.constraint(lessThanOrEqualTo: passwordTextBox.safeAreaLayoutGuide.bottomAnchor, constant: 1),
            line2.heightAnchor.constraint(equalToConstant: 1),
            
            
            logInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:  -250),
            logInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            logInButton.topAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 525),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            
            
            googleButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:  -130),
            googleButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 130),
            googleButton.topAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 625),
            googleButton.heightAnchor.constraint(equalToConstant: 50),
            
            
            
            registerButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:  -25),
            registerButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 250),
            registerButton.topAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 525),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            
            
            logo.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant:  0),
            logo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            logo.topAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
            ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // [START auth_listener]
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            
        }
        // [END auth_listener]
        
    }
    
    override func viewDidLayoutSubviews() {
        
        // this one worked the best
        navigationController?.setNavigationBarHidden(true, animated: false)
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
        
        view.bringSubviewToFront(logInButton)
        view.bringSubviewToFront(registerButton)
        view.bringSubviewToFront(googleButton)
        view.bringSubviewToFront(logo)
        view.bringSubviewToFront(usernameTextBox)
        view.bringSubviewToFront(passwordTextBox)
        view.bringSubviewToFront(line)
        view.bringSubviewToFront(line2)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // [START remove_auth_listener]
        Auth.auth().removeStateDidChangeListener(handle!)
        // [END remove_auth_listener]
    }
    
    
    @objc func registerView(){
        let newViewController = RegisterViewController1()
         self.navigationController?.popViewController(animated: false)
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    
}
