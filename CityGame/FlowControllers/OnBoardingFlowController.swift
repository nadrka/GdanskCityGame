import UIKit

class OnboardingFlowController: FlowController {

    private weak var rootNavigationController: UINavigationController?
    private var isLoggedIn = true
    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
    }

    func startFlow() {
        if isLoggedIn {
            showMapScreen()
        }
    }

    private func showMapScreen() {
        let mapViewController = MapViewController()
        rootNavigationController?.viewControllers = [mapViewController]
    }
}