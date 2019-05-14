import UIKit

class MapViewController: UIViewController {
    private var mainView: MapView!
    private var viewModel: MapViewModel

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(viewModel: MapViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setupView()
    }

    private func setupView() {
        mainView = MapView(viewModel: viewModel)
        view.addSubview(mainView)
        mainView.fillParent()
    }



}

