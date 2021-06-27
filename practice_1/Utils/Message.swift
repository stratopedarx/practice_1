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
    static var range = "range"
    // for SettingsViewController
    static var startOfRange = "start_range"
    static var endOfRange = "end_range"
    static var apply = "apply"
    static var ok = "ok"
    static var newSettings = "new_settings"
}


extension String {
    func localized() -> String {
        NSLocalizedString(self, comment: "")
    }
}
