import Foundation
import FirebaseAuth
import StatusAlert

struct UserRegistrationDetails {
    private(set) var email: String
    private(set) var name: String
    private(set) var password: String
    private(set) var repeatedPassword: String
}

class RegisterViewModel {
    var onSignInButtonTapped: (() -> ())? = nil

    func validate(_ input: UserRegistrationDetails) {
        let doesPasswordMatch = input.password == input.repeatedPassword && input.password.count > 6
        let isEmailValid = isValidEmail(input.email)
        let isNameValid = input.name.count > 3
        
        //============= POST Request =====================
        let url = URL(string: "http://citygame.hostingasp.pl/api/User")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let json: [String: Any] = ["UserName": "ABC",
                                   "Email": "abc@aa.pl",
                                   "PasswordHash": "rrr"]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        }
        
        task.resume()
        
        //==================================================
        
        if !isEmailValid {
            onError(errorMessage: "Invalid email.")
        }

        if !isNameValid {
            onError(errorMessage: "Invalid name.")
        }

        if !doesPasswordMatch {
            onError(errorMessage: "Password does not match or has less than 6 characters.")
        }

        checkIfUserIsValid(email: input.email, password: input.password)
    }

    func isValidEmail(_ testStr: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }

    func checkIfUserIsValid(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) {
            (user, error) in
            if error == nil {
                self.onSignInButtonTapped?()
                print("register success!")
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
