import UIKit
import MapKit
import SnapKit
import CoreLocation

class MapView: UIView, CLLocationManagerDelegate {
    private var mapView: MKMapView!
    private var locationButton: UIImageView!
    private var shouldTrackUserLocation = true
    private var locationManager = CLLocationManager()
    private var regionInMeters: Double = 5000
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
        setupLocationButton()
        checkLocationServices()
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

    private func setupLocationButton() {
        let image = UIImage(named: "next-location")
        locationButton = UIImageView(image: image)
        locationButton.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onLocationButtonTapped))
        locationButton.addGestureRecognizer(tapGesture)
        mapView.addSubview(locationButton)
    }
    
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    @objc func onLocationButtonTapped() {
        print("location button tappped")
        zoomInLocation()
    }
    
    func zoomInLocation(){
        if let location = locationManager.location?.coordinate{
            let region = MKCoordinateRegion(center: location, latitudinalMeters:regionInMeters, longitudinalMeters:regionInMeters)
            mapView.setRegion(mapView.regionThatFits(region), animated: true)
        }
    }

    @objc func didScrollMap() {
//        self.shouldTrackUserLocation = false
    }

    private func applyConstraints() {
        mapView.fillParent()

        locationButton.snp.makeConstraints{
            make in
            make.width.height.equalTo(45.sketchHeight)
            make.right.equalToSuperview().inset(15.sketchWidth)
            make.top.equalTo(self.snp_topMargin).inset(50.sketchHeight)
        }
    }
    
    func checkLocationServices(){
        if CLLocationManager.locationServicesEnabled(){
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            //show alert about turning on location
        }
    }
    
    func checkLocationAuthorization(){
        switch CLLocationManager.authorizationStatus(){
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            zoomInLocation()
            locationManager.startUpdatingLocation()
            break
        case .denied:
            //SHOW ALERT
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            //SHOW ALERT
            break
        case .authorizedAlways:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
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
