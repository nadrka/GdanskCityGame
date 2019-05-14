import Foundation
import FirebaseAuth
import StatusAlert

class LoginViewModel {
    var onLoginButtonTapped: (() -> ())? = nil

    func validate(email: String, password: String) {
        if email.count < 4 || password.count < 4 {
            onError(errorMessage: "Wrong email or password!")
        }
        checkIfUserIsValid(email: email, password: password)
    }

    func checkIfUserIsValid(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) {
            (user, error) in
            if error == nil {
                self.onLoginButtonTapped?()
                print(user?.user.email)
                print("login success!")
            } else {
                self.onError(errorMessage: error?.localizedDescription)
            }
        }
    }

    func onError(errorMessage: String?) {
        guard let error = errorMessage else {
            return
        }
        let statusAlert = StatusAlert()
        statusAlert.image = UIImage(named: "error-alert")
        statusAlert.title = "ERROR"
        statusAlert.message = error
        statusAlert.showInKeyWindow()
    }

}