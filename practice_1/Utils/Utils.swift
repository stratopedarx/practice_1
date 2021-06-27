import UIKit


func sendAlert(_ instance: UIViewController, _ alert: UIAlertController, _ action: UIAlertAction) {
    alert.addAction(action)
    instance.present(alert, animated: true, completion: nil)
}
