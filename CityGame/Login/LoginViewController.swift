import UIKit

class LoginViewController: UIViewController {
    private var mainView: LoginView!
    private var viewModel: LoginViewModel

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "LOGIN".localized
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.tintColor = .white;
        navigationController?.navigationBar.barTintColor = .purple
    }

    private func setupView() {
        mainView = LoginView(viewModel: viewModel)
        view.addSubview(mainView)
        mainView.fillParent()
    }
}