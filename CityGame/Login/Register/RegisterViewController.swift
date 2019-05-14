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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "SIGN_UP".localized
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.tintColor = .white;
        navigationController?.navigationBar.barTintColor = Colors.mainPurple
    }

    private func setupView() {
        mainView = RegisterView(viewModel: viewModel)
        view.addSubview(mainView)
        mainView.fillParent()
    }



}

