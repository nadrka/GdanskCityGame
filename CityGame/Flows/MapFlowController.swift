import UIKit


class MapFlowController: FlowController {
    private weak var rootNavigationController: UINavigationController?

    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
    }

    func startFlow() {
        showMapScreen()
    }

    private func showMapScreen() {
        let mainTabBarController = MainTabBarController()
        rootNavigationController?.setNavigationBarHidden(true, animated: true)
        rootNavigationController?.pushViewController(mainTabBarController, animated: true)
    }
}