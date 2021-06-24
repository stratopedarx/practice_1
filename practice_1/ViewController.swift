import UIKit


// the structure stores different keys for localization
struct Message {
    static var welcome = "welcome"
    static var welcomeAfterSuccessGame = "welcome_after_success_game"
    static var wrongInput = "wrong_input"
    static var tooMuch = "too_much"
    static var tooLittle = "too_little"
    static var victoryTitle = "victory_title"
    static var victoryMessage = "victory_message"
    static var startOver = "start_over"
}


extension String {
    func localized() -> String {
        NSLocalizedString(self, comment: "")
    }
}


class ViewController: UIViewController {
    var computerNumber: Int!
    var startOfRange = 0
    var endOfRange = 100
    @IBOutlet weak var mainMessageLabel: UILabel!
    @IBOutlet weak var numberFromUserTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        mainMessageLabel.text = Message.welcome.localized()
    }
    
    @IBAction func getNumberFromUserAction(_ sender: UIButton) {
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
        }
        victoryAlert.addAction(playAgainAlertAction)
        self.present(victoryAlert, animated: true, completion: nil)
    }
    
}
    

class RandomNumber {
    static func getRandomNumber(_ startOfRange: Int, _ endOfRange: Int) -> Int {
        Int.random(in: startOfRange...endOfRange)
    }
}
