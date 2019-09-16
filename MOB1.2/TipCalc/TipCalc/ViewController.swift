//
//  ViewController.swift
//  TipCalc
//
//  Created by Wesley Espinoza on 11/6/18.
//  Copyright © 2018 HazeStudios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 1
    var isDefaultStatusBar = true
    
    // 2
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return isDefaultStatusBar ? .default : .lightContent
    }
    
    let headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.tcWhite
        return view
    }()
    
    let headerText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tip Calculator"
        label.textColor = .black
        label.font = label.font.withSize(40)
        
        return label
    }()
    
    let headerSwitch: UISwitch = {
       let darkSwitch = UISwitch()
        darkSwitch.translatesAutoresizingMaskIntoConstraints = false
        return darkSwitch
    }()
    
    let bodyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor =  UIColor.tcDarkBlue
        view.layer.cornerRadius = 10
        return view
    }()
    
    let lowerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.tcWhite
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.tcHotPink.cgColor
        return view
    }()
    
    let resetButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.setTitle("RESET", for: .normal)
        button.backgroundColor = UIColor.tcDarkBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let billText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bill Amount:             $"
        label.textColor = .white
        label.font = label.font.withSize(25)
        return label
    }()
    let tipText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tip %:"
        label.textColor = .white
        label.font = label.font.withSize(25)
        return label
    }()
    
    let billTextBox: UITextField = {
       let box = UITextField()
        box.translatesAutoresizingMaskIntoConstraints = false
        box.layer.cornerRadius = 10
        box.keyboardType = .decimalPad
        box.backgroundColor = .white
        box.text = "0.00"
        let bar = UIToolbar()
        let reset = UIBarButtonItem(title: "Calculate", style: .plain, target: self, action: #selector(calculate))
        bar.items = [reset]
        bar.sizeToFit()
        box.inputAccessoryView = bar
        
        return box
    }()
    
    let segmentedControl: UISegmentedControl = {
        let box = UISegmentedControl()
        box.translatesAutoresizingMaskIntoConstraints = false
        box.layer.cornerRadius = 10
        box.backgroundColor = UIColor.tcDarkBlue
        box.layer.borderColor = UIColor.tcHotPink.cgColor
        box.tintColor = UIColor.tcHotPink
        box.insertSegment(withTitle: "15%", at: 0, animated: true)
        box.insertSegment(withTitle: "18%", at: 1, animated: true)
        box.insertSegment(withTitle: "20%", at: 2, animated: true)
        
        box.selectedSegmentIndex = 0
        return box
    }()
    
    
    let tipAmountText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tip Amount:"
        label.textColor = UIColor.tcCharcoal
        label.font = label.font.withSize(20)
        return label
    }()
    
    let totalText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Total:"
        label.textColor = UIColor.tcCharcoal
        label.font = label.font.withSize(20)
        return label
    }()
    
    
    let totalAmount: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$0.00"
        label.textColor = UIColor.tcCharcoal
        label.font = label.font.withSize(20)
        return label
    }()
    
    
    let tipAmount: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$0.00"
        label.textColor = UIColor.tcCharcoal
        label.font = label.font.withSize(20)
        return label
    }()

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        
        view.backgroundColor = UIColor.tcOffWhite
        
        view.addSubview(headerView)
        view.addSubview(headerSwitch)
        view.addSubview(headerText)
        view.addSubview(bodyView)
        view.addSubview(lowerView)
        view.addSubview(resetButton)
        view.addSubview(billText)
        view.addSubview(tipText)
        view.addSubview(billTextBox)
        view.addSubview(segmentedControl)
        view.addSubview(tipAmountText)
        view.addSubview(totalText)
        view.addSubview(tipAmount)
        view.addSubview(totalAmount)
        
        
        NSLayoutConstraint.activate([headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
                                     headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
                                     headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
                                     headerView.heightAnchor.constraint(equalToConstant: 125),
                                     
                                     
                                     headerSwitch.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 55),
                                     headerSwitch.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
                                     
                                     
                                     headerText.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 50),
                                     headerText.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10),
                                     
                                     
                                     bodyView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 25),
                                     bodyView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                                     bodyView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                                     bodyView.heightAnchor.constraint(equalToConstant: 210),
                                     
                                     billText.topAnchor.constraint(equalTo: bodyView.topAnchor, constant: 55),
                                     billText.leadingAnchor.constraint(equalTo: bodyView.leadingAnchor, constant: 15),
                                     
                                     billTextBox.topAnchor.constraint(equalTo: bodyView.topAnchor, constant: 53),
                                     billTextBox.trailingAnchor.constraint(equalTo: bodyView.trailingAnchor, constant: -15),
                                     billTextBox.heightAnchor.constraint(equalToConstant: 35),
                                     billTextBox.widthAnchor.constraint(equalToConstant: 125),
                                     
                                     
                                     tipText.topAnchor.constraint(equalTo: billText.topAnchor, constant: 85),
                                     tipText.leadingAnchor.constraint(equalTo: bodyView.leadingAnchor, constant: 15),
                                     
                                     
                                     segmentedControl.topAnchor.constraint(equalTo: billText.topAnchor, constant: 75),
                                     segmentedControl.trailingAnchor.constraint(equalTo: bodyView.trailingAnchor, constant: -15),
                                     segmentedControl.heightAnchor.constraint(equalToConstant: 45),
                                     segmentedControl.widthAnchor.constraint(equalToConstant: 175),
                                     
                                     
                                     lowerView.topAnchor.constraint(equalTo: bodyView.bottomAnchor, constant: 25),
                                     lowerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                                     lowerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                                     lowerView.heightAnchor.constraint(equalToConstant: 210),
                                     
                                     
                                     tipAmountText.topAnchor.constraint(equalTo: lowerView.topAnchor, constant: 55),
                                     tipAmountText.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 15),
                                     
                                     
                                     totalText.topAnchor.constraint(equalTo: tipAmountText.topAnchor, constant: 85),
                                     totalText.leadingAnchor.constraint(equalTo: lowerView.leadingAnchor, constant: 15),
                                     
                                     
                                     
                                     tipAmount.topAnchor.constraint(equalTo: lowerView.topAnchor, constant: 55),
                                     tipAmount.trailingAnchor.constraint(equalTo: lowerView.trailingAnchor, constant: -15),
                                     
                                     
                                     totalAmount.topAnchor.constraint(equalTo: tipAmount.topAnchor, constant: 85),
                                     totalAmount.trailingAnchor.constraint(equalTo: lowerView.trailingAnchor, constant: -15),
                                     
                                     
                                     
                                     resetButton.topAnchor.constraint(equalTo: lowerView.bottomAnchor, constant: 25),
                                     resetButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                                     resetButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                                     resetButton.heightAnchor.constraint(equalToConstant: 60)
                                     ])
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme(isDark: false)
    }
    

    @objc func calculate(){
        billTextBox.resignFirstResponder()
        
        let bill = Double(billTextBox.text!)
        
        switch segmentedControl.selectedSegmentIndex{
            
        case 0:
            let tip = bill! * 0.15
            tipAmount.text = "$\(tip)"
            totalAmount.text = "$\(bill! + tip)"
            break
        case 1:
            let tip = bill! * 0.18
            tipAmount.text = "$\(tip)"
            totalAmount.text = "$\(bill! + tip)"
            break
        case 2:
            let tip = bill! * 0.20
            tipAmount.text = "$\(tip)"
            totalAmount.text = "$\(bill! + tip)"
            break
            
            
        default:
            print("error")
        }
        
    }
    
    func themeSwitch(_ sender: UISwitch){
        setTheme(isDark: sender.isOn)
            }
    
    
    func setTheme(isDark: Bool) {
        
        let theme = isDark ? ColorTheme.dark : ColorTheme.light
        
        isDefaultStatusBar = theme.isDefaultStatusBar
        setNeedsStatusBarAppearanceUpdate()
        
        view.backgroundColor = theme.viewControllerBackgroundColor
        
        headerView.backgroundColor = theme.primaryColor
        headerText.textColor = theme.primaryTextColor
        
        headerView.backgroundColor = theme.secondaryColor
        
        billTextBox.tintColor = theme.accentColor
        segmentedControl.tintColor = theme.accentColor
        
        lowerView.backgroundColor = theme.primaryColor
        lowerView.layer.borderColor = theme.accentColor.cgColor
        
        tipAmount.textColor = theme.primaryTextColor
        totalAmount.textColor = theme.primaryTextColor
        
        tipAmount.textColor = theme.outputTextColor
        totalAmount.textColor = theme.outputTextColor
        
        resetButton.backgroundColor = theme.secondaryColor
    }
    
}

