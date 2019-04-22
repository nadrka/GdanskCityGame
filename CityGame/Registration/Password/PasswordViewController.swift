import UIKit

class PasswordViewController: UIViewController {
    private var mainView: PasswordView!


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        setupView()
    }

    private func setupView() {
        mainView = PasswordView()
        view.addSubview(mainView)
        mainView.fillParent()
    }



}

