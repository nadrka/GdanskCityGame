import Foundation

struct UserRegistrationDetails {
    private(set) var login: String
    private(set) var name: String
    private(set) var password: String
    private(set) var repeatedPassword: String
}

class RegisterViewModel {
    var onSignInButtonTapped: (() -> ())? = nil

    func validate(_ input: UserRegistrationDetails) {
        let doesPasswordMatch = input.password == input.repeatedPassword && input.password.count > 6
        let isLoginValid = input.login.count > 5
        let isNameValid = input.name.count > 5

        if doesPasswordMatch && isLoginValid && isNameValid {
            onSignInButtonTapped?()
        }
    }

}