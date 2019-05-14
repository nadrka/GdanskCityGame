import UIKit

class CreateGroupViewController: UIViewController{
    private var mainView: CreateGroupView!
    private var viewModel: CreateGroupViewModel

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(viewModel: CreateGroupViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = "CREATE_GROUP".localized
        setupView()
    }

    private func setupView() {
        mainView = CreateGroupView(viewModel: viewModel)
        view.addSubview(mainView)
        mainView.fillParent()
    }
}

