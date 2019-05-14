import UIKit

class GameFlowController: FlowController {
    private weak var gameNavigationController: UINavigationController?
    private var gameViewModel: GameViewModel

    init(rootNavigationController: UINavigationController, viewModel: GameViewModel) {
        self.gameNavigationController = rootNavigationController
        self.gameViewModel = viewModel
    }

    func startFlow() {
        gameViewModel.onGameChosen = {
            [weak self] in
            self?.showMapScreen()
        }
    }

    private func showMapScreen() {
        let mapViewModel = MapViewModel()
        let mapViewController = MapViewController(viewModel: mapViewModel)
        gameNavigationController?.pushViewController(mapViewController, animated: true)
    }
}