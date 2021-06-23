//
//  ViewController.swift
//  practice_1
//
//  Created by user199993 on 6/22/21.
//

import UIKit

class ViewController: UIViewController {
    var a: Int!  // random number from computer
    var b: Int!  // current number from user
    var startOfRange = 0
    var endOfRange = 100
    @IBOutlet weak var mainMessageLabel: UILabel!
    @IBOutlet weak var numberFromUserTextField: UITextField!

    
    @IBAction func getNumberFromUserAction(_ sender: UIButton) {
        if let numberFromUser = Int(numberFromUserTextField.text!) {
            if a == nil {
                a = RandomNumber.getRandomNumber(startOfRange, endOfRange)
            }
            if numberFromUser > a {
                mainMessageLabel.text = "Too much"
            } else if numberFromUser < a {
                mainMessageLabel.text = "Too little"
            } else {
                showVictoryAlert()
            }
        }
    }
    
    func showVictoryAlert() {
        let victoryAlert = UIAlertController(title: "Great victory!", message: "Сongratulations", preferredStyle: .alert)
        let playAgainAlertAction = UIAlertAction(title: "Start over", style: .default) { action in
            print(action)
            self.mainMessageLabel.text = "Welcome"
            self.a = nil
        }
        victoryAlert.addAction(playAgainAlertAction)
        self.present(victoryAlert, animated: true, completion: nil)
    }
    
}
    

class RandomNumber {
    static func getRandomNumber(_ startOfRange: Int, _ endOfRange: Int) -> Int {
        100
    }
}
