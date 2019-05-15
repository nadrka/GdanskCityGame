import Foundation
import StatusAlert

class StatusAlertPresenter {

    static func showStatusAlert(title: String, message: String, image: UIImage? = nil) {
        let statusAlert = StatusAlert()
        if let image = image {
            statusAlert.image = image
        }
        statusAlert.title = title
        statusAlert.message = message
        statusAlert.showInKeyWindow()
    }
}