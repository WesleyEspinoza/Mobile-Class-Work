//
//  ViewController.swift
//  Shout
//
//  Created by Wesley Espinoza on 11/14/18.
//  Copyright © 2018 HazeStudios. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UIViewController {
    
    var dataReceived: String = ""
    
    let messageView: UIView = {
        let view = UIView()
        let colorArr:[String] = ["#35CDD8","#A5B557","#354E71"]
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 25
        view.layer.shadowOpacity = 0.4
        view.layer.shadowRadius = 10
        return view
    }()
    
    let tableView: UITableView = {
        let tView = UITableView()
        tView.translatesAutoresizingMaskIntoConstraints = false
        tView.rowHeight = 100
        tView.backgroundColor = UIColor.init(hexString: "#841F27")
        tView.separatorInset = .zero
        return tView
    }()
    
    let sips: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "sip"), for: .normal)
        button.isHidden = true
        
        return button
    }()
    
    
    let message: UITextView = {
        let message = UITextView()
        let colorArr:[String] = ["#35CDD8","#A5B557","#354E71"]
        message.translatesAutoresizingMaskIntoConstraints = false
        message.isEditable = false
        message.isUserInteractionEnabled = false
        message.backgroundColor = UIColor(hexString: colorArr.randomElement()!)
        message.textColor = .white
        message.layer.cornerRadius = 25
        message.textAlignment = .center
        message.font = UIFont.systemFont(ofSize: 25)
        
        return message
    }()
    
    let sendButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 25
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.setTitleColor(.darkGray, for: .normal)
        button.setTitleColor(.white, for: .highlighted)
        button.setTitle("10", for: .normal)
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(popUpWarningForSend), for: .touchUpInside)
        
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (t) in
            
            if(button.tag != 15)
            {
                button.setTitle("\(15-button.tag)", for: .normal)
                
                button.tag += 1
            }
            else
            {
                t.invalidate()
                button.setTitle("Send Message", for: .normal)
            }
            
            
        })
        
        return button
    }()
    
    let anotherButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 25
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.setTitleColor(.darkGray, for: .normal)
        button.setTitleColor(.white, for: .highlighted)
        button.setTitle("10", for: .normal)
        button.layer.borderWidth = 2
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (t) in
            
            if(button.tag != 15)
            {
                button.setTitle("\(15-button.tag)", for: .normal)
                
                button.tag += 1
            }
            else
            {
                t.invalidate()
                button.setTitle("⟲", for: .normal)
                button.addTarget(self, action: #selector(reload), for: .touchUpInside)
            }
            
            
        })
        
        
        return button
    }()
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .done, target: self, action: #selector(goBack))
        navigationItem.title = dataReceived
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(goBack))
        
        
        
        view.backgroundColor = UIColor(hexString: "#841F27")
        ShoutServices.makeRequest { (shout) in
            DispatchQueue.main.async {
                self.message.text = (shout[0].content)
            }
        }
        hideKeyboardWhenTappedAround()
        view.addSubview(messageView)
        view.addSubview(sendButton)
        view.addSubview(anotherButton)
        view.addSubview(message)
        view.addSubview(tableView)
        messageView.addSubview(sips)
        
        NSLayoutConstraint.activate([
            messageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            messageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            messageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            messageView.heightAnchor.constraint(equalToConstant: 300),
            
            message.topAnchor.constraint(equalTo: messageView.topAnchor, constant: 25),
            message.leadingAnchor.constraint(equalTo: messageView.leadingAnchor, constant: 15),
            message.trailingAnchor.constraint(equalTo: messageView.trailingAnchor, constant: -15),
            message.heightAnchor.constraint(equalToConstant: 200),
            
            
            
            sendButton.topAnchor.constraint(equalTo: messageView.bottomAnchor, constant: 25),
            sendButton.leadingAnchor.constraint(equalTo: messageView.leadingAnchor, constant: 150),
            sendButton.trailingAnchor.constraint(equalTo: messageView.trailingAnchor, constant: 0),
            sendButton.heightAnchor.constraint(equalToConstant: 50),
            
            
            anotherButton.topAnchor.constraint(equalTo: messageView.bottomAnchor, constant: 25),
            anotherButton.leadingAnchor.constraint(equalTo: messageView.leadingAnchor, constant: 0),
            anotherButton.trailingAnchor.constraint(equalTo: messageView.trailingAnchor, constant: -200),
            anotherButton.heightAnchor.constraint(equalToConstant: 50),
            
            
            sips.trailingAnchor.constraint(equalTo: messageView.trailingAnchor, constant: -25),
            sips.bottomAnchor.constraint(equalTo: messageView.bottomAnchor, constant: -5),
            sips.heightAnchor.constraint(equalToConstant: 75),
            
            
            tableView.topAnchor.constraint(equalTo: sendButton.bottomAnchor, constant: 25),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
            ])
        
        
        
    }
    
    
    @objc func goBack(){
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        UIView.animate(withDuration: 15, animations: {
            self.messageView.backgroundColor = UIColor.init(hexString: "#841F27")
            self.message.backgroundColor = .white
            
        }) { (true) in
            self.message.text = ""
            self.message.isEditable = true
            self.message.becomeFirstResponder()
            self.message.textColor = UIColor.darkGray
            self.message.isUserInteractionEnabled = true
            self.sips.isHidden = false
        }
        
        sips.addTarget(self, action: #selector(popUpWarning), for: .touchUpInside)
        
        
    }
    @objc func popUpWarning(){
        let alert = UIAlertController(title: "This Feature is coming soon", message: "Just like this one we have plenty of other features planned!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cool!", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    @objc func popUpWarningForSend(){
        let alert = UIAlertController(title: "Coming Soon!", message: "We are currently refractoring our Db and sending will be online soon", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Great!", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification){
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height - 225
            }
        }
        
    }
    
    @objc func keyboardWillHide(){
        self.view.frame.origin.y = 0
        
    }
    @objc func reload(){
       self.anotherButton.isEnabled = false
        self.sendButton.isEnabled = false
        self.anotherButton.tag = 0
        let colorArr:[String] = ["#35CDD8","#A5B557","#354E71"]
        ShoutServices.makeRequest { (shout) in
            DispatchQueue.main.async {
                self.message.text = (shout[0].content)
            }
        }
        messageView.backgroundColor = .white
        message.backgroundColor = UIColor.init(hexString: colorArr.randomElement() ?? "#35CDD8")
        message.textColor = .white
        
        UIView.animate(withDuration: 15, animations: {
            self.messageView.backgroundColor = UIColor.init(hexString: "#841F27")
            self.message.backgroundColor = .white
            
        }) { (true) in
            self.message.text = ""
            self.message.isEditable = true
            self.message.becomeFirstResponder()
            self.message.textColor = UIColor.darkGray
            self.message.isUserInteractionEnabled = true
        }
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (t) in
            
            if(self.anotherButton.tag != 15)
            {
                self.anotherButton.setTitle("\(15-self.anotherButton.tag)", for: .normal)
                self.sendButton.setTitle("\(15-self.anotherButton.tag)", for: .normal)
                self.anotherButton.tag += 1
                
            }
            else
            {
                t.invalidate()
                self.anotherButton.setTitle("⟲", for: .normal)
                self.anotherButton.isEnabled = true
                self.sendButton.setTitle("Send Message", for: .normal)
                self.sendButton.isEnabled = true
            }
            
            
        })
        
        
    }
}
