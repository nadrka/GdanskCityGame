import UIKit
import MapKit
import SnapKit

class MapView: UIView, CLLocationManagerDelegate {
    private var mapView: MKMapView!
    private var shouldTrackUserLocation = true
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero)
        setupMainView()

        applyConstraints()
    }

    private func setupMainView() {
        setupMapView()
    }

    func setupMapView() {
        mapView = MKMapView()
        mapView.delegate = self
        mapView.isRotateEnabled = false
        addPanGestureRecognizerForMap()
        addSubview(mapView)
    }
    func addPanGestureRecognizerForMap() {
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didScrollMap))
        gestureRecognizer.delegate = self
        mapView.addGestureRecognizer(gestureRecognizer)
    }

    @objc func didScrollMap() {
//        self.shouldTrackUserLocation = false
    }

    private func applyConstraints() {
        mapView.fillParent()
    }
}

extension MapView: MKMapViewDelegate {
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .none
    }

    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        return nil
    }

    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        if shouldTrackUserLocation {
            mapView.setCenter((mapView.userLocation.location?.coordinate)!, animated: true)
            mapView.showAnnotations([userLocation], animated: true)
        }
    }

}

extension MapView: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}