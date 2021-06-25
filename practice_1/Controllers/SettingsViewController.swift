//
//  SettingsViewController.swift
//  practice_1
//
//  Created by user199993 on 6/24/21.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var startOfRangeTLabel: UILabel!
    @IBOutlet weak var endOfRangeLabel: UILabel!
    @IBOutlet weak var startOfRangeTextFiled: UITextField!
    @IBOutlet weak var endOfRangeTextFiled: UITextField!
    @IBOutlet weak var applyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startOfRangeTLabel.text = Message.startOfRange.localized()
        endOfRangeLabel.text = Message.endOfRange.localized()
        startOfRangeTextFiled.placeholder = String(globalSettings.startOfRange)
        endOfRangeTextFiled.placeholder = String(globalSettings.endOfRange)
        applyButton.setTitle(Message.apply.localized(), for: .normal)
    }

    @IBAction func applySettingsAction(_ sender: UIButton) {
        if let startOfRange = Int(startOfRangeTextFiled.text!), let endOfRange = Int(endOfRangeTextFiled.text!) {
            // TODO: filter negative numbers
            globalSettings.startOfRange = startOfRange
            globalSettings.endOfRange = endOfRange
            let successAlert = UIAlertController(title: Message.newSettings.localized(), message: "😀", preferredStyle: .alert)
            let successAlertAction = UIAlertAction(title: Message.ok.localized(), style: .default)
            sendAlert(self, successAlert, successAlertAction)
        } else {
            let errorAlert = UIAlertController(title: Message.wrongInput.localized(), message: "😕", preferredStyle: .alert)
            let errorAlertAction = UIAlertAction(title: Message.ok.localized(), style: .default)
            sendAlert(self, errorAlert, errorAlertAction)
        }
    }
}
