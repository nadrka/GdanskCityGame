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
        let mapViewModel = MapViewModel(gameId: 1)
        let mapViewController = MapViewController(viewModel: mapViewModel)
        mapViewModel.onTaskButtonTapped = {
            [weak self] in
            self?.showMonumentTaskScreen()
        }

        mapViewModel.onDetailsButtonTapped = {
            [weak self] in
            self?.showMonumentDetailsScreen()
        }
        gameNavigationController?.pushViewController(mapViewController, animated: true)
    }

    private func showMonumentDetailsScreen() {
        //todo: show monument details screen
    }

    private func showMonumentTaskScreen() {
        //todo: show monument task screen
    }
}