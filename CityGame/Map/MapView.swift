import UIKit
import MapKit
import SnapKit

class MapView: UIView, CLLocationManagerDelegate {
    private var mapView: MKMapView!
    private var locationButton: UIImageView!
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
        setupLocationButton()
        setupPinView()
        
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

    @objc func onLocationButtonTapped() {
        print("location button tappped")
    }
    
    func setupPinView(){
        let locationBazylika = CLLocationCoordinate2D(latitude: 54.349822, longitude: 18.653242)
        
        let region = MKCoordinateRegion(center:  locationBazylika, span: MKCoordinateSpan(latitudeDelta: 0.009, longitudeDelta: 0.009 ))
        mapView.setRegion(region, animated: true)
        
        let pin1 = customPin(pinTitle: "Bazylika Mariacka", pinSubTitle: "Wniebowziecia Najswietszej Maryi Panny", location: locationBazylika)
        
        //location: Dwor Artusa
        let locationDworArtusa = CLLocationCoordinate2D(latitude: 54.348850, longitude: 18.653394)
        
        let pin2 = customPin(pinTitle: "Dwor Artusa", pinSubTitle: "Lokalna historia w starej kamienicy", location: locationDworArtusa)
        
        //location: neptun
        let locationNeptun = CLLocationCoordinate2D(latitude: 54.348628, longitude: 18.653216)
        
        let pin3 = customPin(pinTitle: "Fontanna Neptuna", pinSubTitle: "XVII-wieczny posag z brazu i fontanna", location: locationNeptun)
        
        //location: zuraw
        let locationZuraw = CLLocationCoordinate2D(latitude: 54.350605, longitude: 18.657509)
        
        let pin4 = customPin(pinTitle: "Zuraw", pinSubTitle: "Oddzial Narodowego Muzeum Morskiego", location: locationZuraw)
        
        //location: Zlota Brama
        let locationZlotaBrama = CLLocationCoordinate2D(latitude: 54.349760, longitude: 18.648074)
        
        let pin5 = customPin(pinTitle: "Zlota Brama", pinSubTitle: "", location: locationZlotaBrama)
        
        //location: Akademia Sztuk Pieknych
        let locationAkademia = CLLocationCoordinate2D(latitude: 54.350799, longitude: 18.649083)
        
        let pin6 = customPin(pinTitle: "Akademia Sztuk Pieknych", pinSubTitle: "Szkola Artystyczna", location: locationAkademia)
        
        mapView.addAnnotation(pin1)
        mapView.addAnnotation(pin2)
        mapView.addAnnotation(pin3)
        mapView.addAnnotation(pin4)
        mapView.addAnnotation(pin5)
        mapView.addAnnotation(pin6)
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

class customPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(pinTitle:String, pinSubTitle:String, location:CLLocationCoordinate2D) {
        self.title = pinTitle
        self.subtitle = pinSubTitle
        self.coordinate = location
    }
}
