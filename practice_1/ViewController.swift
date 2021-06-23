import UIKit


enum Message: String {
    case welcome = "Hello, friend. My name is Bob iOS. I’m thinking of a number 0-100. Can you guess it?"
    case welcomeAfterSuccessGame = "Enjoyed? Then come on one more time! Number 0-100. Guess it?"
    case wrongInput = "Wrong input. Please, try again"
    case tooMuch = "Too much. Try again"
    case tooLittle = "Too little. Try again"
    case victoryTitle = "Great victory!"
    case victoryMessage = "Сongratulations"
    case startOver = "Start over"
}


class ViewController: UIViewController {
    var computerNumber: Int!
    var startOfRange = 0
    var endOfRange = 100
    @IBOutlet weak var mainMessageLabel: UILabel!
    @IBOutlet weak var numberFromUserTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        mainMessageLabel.text = Message.welcome.rawValue
    }
    
    @IBAction func getNumberFromUserAction(_ sender: UIButton) {
        if let numberFromUser = Int(numberFromUserTextField.text!) {
            if computerNumber == nil {
                computerNumber = RandomNumber.getRandomNumber(startOfRange, endOfRange)
            }
            if numberFromUser > computerNumber {
                mainMessageLabel.text = Message.tooMuch.rawValue
            } else if numberFromUser < computerNumber {
                mainMessageLabel.text = Message.tooLittle.rawValue
            } else {
                showVictoryAlert()
            }
        } else {
            mainMessageLabel.text = Message.wrongInput.rawValue
        }
    }
    
    func showVictoryAlert() {
        let victoryAlert = UIAlertController(title: Message.victoryTitle.rawValue, message: Message.victoryMessage.rawValue, preferredStyle: .alert)
        let playAgainAlertAction = UIAlertAction(title: Message.startOver.rawValue, style: .default) { action in
            self.mainMessageLabel.text = Message.welcomeAfterSuccessGame.rawValue
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
