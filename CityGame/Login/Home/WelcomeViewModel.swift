import Foundation



class WelcomeViewModel {

    var onSignInButtonTapped: (() -> ())? = nil
    var onSignUpButtonTapped: (() -> ())? = nil

    func validate() {
        onSignInButtonTapped?()
    }
}