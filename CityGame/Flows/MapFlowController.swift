import UIKit


class MapFlowController: FlowController {
    private weak var rootNavigationController: UINavigationController?
    private var mainTabBarController: MainTabBarController!
    private var gameFlowController: GameFlowController!

    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
    }

    func startFlow() {
        showMapScreen()
    }

    private func showMapScreen() {
        mainTabBarController = MainTabBarController()
        bindControllers()
        rootNavigationController?.setNavigationBarHidden(true, animated: true)
        rootNavigationController?.pushViewController(mainTabBarController, animated: true)
    }

    private func bindControllers() {
        createGameFlow()
        bindFriendController()
        bindGroupController()
    }

    private func createGameFlow() {
        let gameViewModel = mainTabBarController.gameViewModel
        let gameViewController = mainTabBarController.gameNavigationController
        gameViewController?.navigationBar.tintColor = Colors.lightPurple;
        gameFlowController = GameFlowController(rootNavigationController: gameViewController!, viewModel: gameViewModel!)
        gameFlowController.startFlow()
    }

    private func bindFriendController() {

    }

    private func bindGroupController() {

    }

    private func showCreateGroupScreen() {

    }
}