import UIKit

class GameViewController: UIViewController {
    private var mainView: GameView!
    private var viewModel: GameViewModel

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(viewModel: GameViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setupView()
    }

    private func setupView() {
        mainView = GameView(viewModel: viewModel)
        view.addSubview(mainView)
        mainView.fillParent()
    }
}