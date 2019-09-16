//
//  CatagorySelectionView.swift
//  Shout
//
//  Created by Wesley Espinoza on 12/5/18.
//  Copyright © 2018 HazeStudios. All rights reserved.
//

import Foundation
import UIKit

class CatagorySelectionView: UIViewController {
    let colorArr:[String] = ["#35CDD8","#A5B557","#354E71"]
    let topicArr:[String] = ["personal","politics","block busters", "R@nt", "Youtube", "Conspiracies", "Music", "Celebs", "School Systems", "cthulhu"]
    
    lazy var collectionView: UICollectionView = {
        // Instantiating the UICollectionView, using the default flow layout
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: CustomFlowLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Setting the datasource & delegate
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Customization
        collectionView.alwaysBounceVertical = true
        
        //Registering the cell
        collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
        
        
        return collectionView
    }()

    
    var data: [Int] = Array(0..<10)
    
    override func viewWillAppear(_ animated: Bool) {
        ShoutServices.makeRequest { (shout) in
            DispatchQueue.main.async {
            }
        }
        collectionView.backgroundColor = UIColor(hexString: "#841F27")
        navigationController?.navigationBar.barTintColor = UIColor(hexString: "#841F27")
    }
    override func loadView() {
        super.loadView()
        view.addSubview(collectionView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .done, target: self, action: #selector(showOptions(controller:)))
        navigationItem.title = "R@nt"
        
        
    }
    
    @objc func showOptions(controller: UIViewController) {
        let alert = UIAlertController(title: "Options", message: "Choose an update", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Example", style: .default, handler: { (_) in
            self.collectionView.performBatchUpdates({
                
                self.data[3] = 808080
                let updated = self.data[3]
                self.data.remove(at: 3)
                self.data.remove(at: 2)
                self.data.insert(updated, at: 0)
                
                self.collectionView.reloadItems(at: [IndexPath(item: 3, section: 0)])
                self.collectionView.deleteItems(at: [IndexPath(item: 2, section: 0)])
                self.collectionView.moveItem(at: IndexPath(item: 3, section: 0), to:  IndexPath(item: 0, section: 0))
                
            }, completion: nil)
            
        }))
        
        alert.addAction(UIAlertAction(title: "Insert 3 at the beginning", style: .default, handler: { (_) in
        }))
        self.data[3] = 808080
        let updated = self.data[3]
        self.data.remove(at: 3)
        self.data.insert(updated, at: 0)
        
        
        alert.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
            self.data = Array(0..<10)
            self.collectionView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
        }))
        
        self.present(alert, animated: true, completion:nil)
    }
    
}


extension CatagorySelectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return topicArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as! Cell
        
        cell.buttonLabel.text = String("@ \(topicArr[indexPath.row])")
        cell.buttonLabel.textColor = .white
        return cell
    }
}

extension CatagorySelectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextViewController = ViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
        nextViewController.dataReceived = "R@nt @ \(topicArr[indexPath.row])"
    }
    
}

extension CatagorySelectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 4 * 1.8, height: collectionView.bounds.height / 4 )
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 25, left: 10, bottom: 25, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
}

