import UIKit

class PersonDetailsRegistrationViewController: UIViewController {
    private var mainView: PersonDetailsRegistrationView!


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        setupView()
    }

    private func setupView() {
        mainView = PersonDetailsRegistrationView()
        view.addSubview(mainView)
        mainView.fillParent()
    }



}

