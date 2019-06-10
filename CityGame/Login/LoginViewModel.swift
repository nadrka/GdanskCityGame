import Foundation
import FirebaseAuth
import StatusAlert
import Alamofire


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
        
            //============= GET Request =======================

            let url = URL(string: "http://citygame.hostingasp.pl/api/User?UserName=Stachu&Password=Stachu1@")!
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue.main) {(response, data, error) in
                guard let data = data else { return }
                print(String(data: data, encoding: .utf8)!)
            }
            
            //=================================================
            
            if error == nil {
                self.onLoginButtonTapped?()
                print(user?.user.email)
                print("login success!")
            } else {
                print("login success!")
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
