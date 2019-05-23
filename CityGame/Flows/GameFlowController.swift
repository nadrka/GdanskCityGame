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
        let alertPresenter = DefaultAlertPresenter(rootViewController: mapViewController)
        mapViewModel.alertPresenter = alertPresenter
        mapViewModel.onTaskButtonTapped = {
            [weak self] in
            self?.showMonumentTaskScreen(mapViewModel: mapViewModel)
        }

        mapViewModel.onDetailsButtonTapped = {
            [weak self] in
            self?.showMonumentDetailsScreen()
        }

        mapViewModel.onEndGame = {
            mapViewController.navigationController?.popViewController(animated: true)
        }
        gameNavigationController?.pushViewController(mapViewController, animated: true)
    }

    private func showMonumentDetailsScreen() {
        //todo: show monument details screen
    }

    private func showMonumentTaskScreen(mapViewModel: MapViewModel) {
        let taskViewModel = TaskViewModel()
        taskViewModel.onTaskCompleted = {
            self.gameNavigationController?.popViewController(animated: true)
            mapViewModel.showNextMarker()
        }
        let taskViewController = TaskViewController(viewModel: taskViewModel)
        gameNavigationController?.pushViewController(taskViewController, animated: true)
    }
}