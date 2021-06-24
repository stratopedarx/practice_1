import Foundation


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
    static var steps = "steps"
}


extension String {
    func localized() -> String {
        NSLocalizedString(self, comment: "")
    }
}
