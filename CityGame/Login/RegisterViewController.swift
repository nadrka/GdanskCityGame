import UIKit

class RegisterViewController: UIViewController {
    private var mainView: RegisterView!
    private var viewModel: RegisterViewModel

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setupView()
    }

    private func setupView() {
        mainView = RegisterView(viewModel: viewModel)
        view.addSubview(mainView)
        mainView.fillParent()
    }



}

