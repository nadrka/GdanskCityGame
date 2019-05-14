import UIKit

class WelcomeViewController: UIViewController {
    private var mainView: WelcomeView!
    private var viewModel: WelcomeViewModel

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(viewModel: WelcomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setupView()
    }

    private func setupView() {
        mainView = WelcomeView(viewModel: viewModel)
        view.addSubview(mainView)
        mainView.fillParent()
    }



}

