//
//  ConfirmHabitViewController.swift
//  Habitual
//
//  Created by Wesley Espinoza on 12/15/18.
//  Copyright © 2018 HazeStudios. All rights reserved.
//

import UIKit

class ConfirmHabitViewController: UIViewController {
    @IBOutlet weak var habitImageView: UIImageView!
    var habitImage: Habit.Images!
    @IBOutlet weak var habitTextInpuField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        habitImageView.image = habitImage.image

        // Do any additional setup after loading the view.
    }
    
    private func updateUI() {
        title = "New Habit"
        habitImageView.image = habitImageView.image
    }
    @IBAction func habitButtonpress(_ sender: UIButton) {
        var persistenceLayer = PersistenceLayer()
        guard let habitText = habitTextInpuField.text else { return }
        persistenceLayer.createNewHabit(name: habitText, image: habitImage)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
