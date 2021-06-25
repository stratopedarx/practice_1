import UIKit


class ViewController: UIViewController {
    var computerNumber: Int!
    var numberOfSteps = 0 {
        didSet {
            stepLabel.text = "\(Message.steps.localized()) : \(numberOfSteps)"
        }
    }
    var range: (Int, Int) = (globalSettings.startOfRange, globalSettings.endOfRange) {
        didSet {
            rangeLabel.text = "\(Message.range.localized()): \(range.0)-\(range.1)"
        }
    }
    
    @IBOutlet weak var mainMessageLabel: UILabel!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var numberFromUserTextField: UITextField!
    @IBOutlet weak var stepLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainMessageLabel.text = Message.welcome.localized()
        range = (globalSettings.startOfRange, globalSettings.endOfRange)
    }

    @IBAction func getNumberFromUserAction(_ sender: UIButton) {
        numberOfSteps += 1
        range = (globalSettings.startOfRange, globalSettings.endOfRange)  // TODO: delete later
        if let numberFromUser = Int(numberFromUserTextField.text!) {
            if computerNumber == nil {
                computerNumber = RandomNumber.getRandomNumber(globalSettings.startOfRange, globalSettings.endOfRange)
            }
            if numberFromUser > computerNumber {
                mainMessageLabel.text = Message.tooMuch.localized()
            } else if numberFromUser < computerNumber {
                mainMessageLabel.text = Message.tooLittle.localized()
            } else {
                showVictoryAlert()
            }
        } else {
            mainMessageLabel.text = Message.wrongInput.localized()
        }
    }
    
    func showVictoryAlert() {
        let victoryAlert = UIAlertController(title: Message.victoryTitle.localized(),
                                             message: Message.victoryMessage.localized(),
                                             preferredStyle: .alert)
        let playAgainAlertAction = UIAlertAction(title: Message.startOver.localized(), style: .default) { action in
            self.mainMessageLabel.text = Message.welcomeAfterSuccessGame.localized()
            self.computerNumber = nil
            self.numberOfSteps = 0
        }
        sendAlert(self, victoryAlert, playAgainAlertAction)
    }
}

