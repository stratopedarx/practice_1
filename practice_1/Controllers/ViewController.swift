import UIKit


class ViewController: UIViewController {
    var computerNumber: Int!
    var startOfRange = 0
    var endOfRange = 100
    var numberOfSteps = 0 {
        didSet {
            stepLabel.text = "\(Message.steps.localized()) : \(numberOfSteps)"
        }
    }
    
    @IBOutlet weak var mainMessageLabel: UILabel!
    @IBOutlet weak var numberFromUserTextField: UITextField!
    @IBOutlet weak var stepLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainMessageLabel.text = Message.welcome.localized()
    }
    
    @IBAction func getNumberFromUserAction(_ sender: UIButton) {
        numberOfSteps += 1
        if let numberFromUser = Int(numberFromUserTextField.text!) {
            if computerNumber == nil {
                computerNumber = RandomNumber.getRandomNumber(startOfRange, endOfRange)
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
        victoryAlert.addAction(playAgainAlertAction)
        self.present(victoryAlert, animated: true, completion: nil)
    }
}

