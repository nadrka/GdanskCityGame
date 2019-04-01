import UIKit

class MapViewController: UIViewController {
    private var mainView: MapView!


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        setupView()
    }

    private func setupView() {
        mainView = MapView()
        view.addSubview(mainView)
        mainView.fillParent()
    }



}

