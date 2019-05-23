import Foundation

class TaskViewModel {
    var photoAdded = false
    var onTaskCompleted: (() -> ())? = nil
    var onTakePhotoButtonTapped: (() -> ())? = nil

    func validate() {
        if photoAdded {
            sendImageToServer()
        } else {
            showAlert()
        }
    }

    func sendImageToServer() {
        onTaskCompleted?()
    }

    private func showAlert() {
        StatusAlertPresenter.showStatusAlert(title: "Eyyy!", message: "You need to take a picture of monument to complete the task.")
    }
}