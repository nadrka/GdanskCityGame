import UIKit

class OnboardingFlowController: FlowController {

    private weak var rootNavigationController: UINavigationController?
    private var isLoggedIn: Bool = true
    var onUserAlreadyLoggedIn: (()->())? = nil
    var onUserLoggedIn: (()->())? = nil
    var onUserRegistered: (()->())? = nil

    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
    }

    func startFlow() {
        if isLoggedIn {
            onUserLoggedIn?()
        } else {
            showWelcomeScreen()
        }
    }


    private func showWelcomeScreen() {
        let welcomeViewModel = WelcomeViewModel()
        welcomeViewModel.onSignUpButtonTapped = {
            [weak self] in
            self?.showRegistrationScreen()
        }

        welcomeViewModel.onSignInButtonTapped = {
            [weak self] in
            self?.showLoginScreen()
        }
        let welcomeViewController = WelcomeViewController(viewModel: welcomeViewModel)
        rootNavigationController?.setNavigationBarHidden(true, animated: true)
        rootNavigationController?.viewControllers = [welcomeViewController]
    }

    private func showRegistrationScreen() {
        let registrationViewModel = RegisterViewModel()
        registrationViewModel.onSignInButtonTapped = {
            self.onUserRegistered?()
        }
        let registrationViewController = RegisterViewController(viewModel: registrationViewModel)
        rootNavigationController?.setNavigationBarHidden(false, animated: true)
        rootNavigationController?.pushViewController(registrationViewController, animated: true)
    }

    private func showLoginScreen() {
        let loginViewModel = LoginViewModel()
        loginViewModel.onLoginButtonTapped = {
            self.onUserLoggedIn?()
        }
        let loginViewController = LoginViewController(viewModel: loginViewModel)
        rootNavigationController?.setNavigationBarHidden(false, animated: true)
        rootNavigationController?.pushViewController(loginViewController, animated: true)
    }
}