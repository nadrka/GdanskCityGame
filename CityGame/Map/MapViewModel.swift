import Foundation
import MapKit

class MapViewModel {
    private var mapView: MKMapView!
    var alertPresenter: AlertPresenter!
    var onTaskButtonTapped: (() -> ())? = nil
    var onDetailsButtonTapped: (() -> ())? = nil
    var onEndGame: (()->())? = nil
    var monuments: [Monument] = [
        Monument(id: 1, name: "Bazylika Mariacks", description: "Description of Bazylika Mariacka", location: CLLocationCoordinate2D(latitude: 54.349822, longitude: 18.653242)),
        Monument(id: 2, name: "Dwór Artusa", description: "Description of Dwór Artusa", location: CLLocationCoordinate2D(latitude: 54.348850, longitude: 18.653394)),
        Monument(id: 3, name: "Fontanna Neptuna", description: "Description of Fontanna Neptuna", location: CLLocationCoordinate2D(latitude: 54.348628, longitude: 18.653216)),
        Monument(id: 4, name: "Żuraw", description: "Description of Żuraw", location: CLLocationCoordinate2D(latitude: 54.350605, longitude: 18.657509)),
        Monument(id: 5, name: "Złota Brama", description: "Description of Złota Brama", location: CLLocationCoordinate2D(latitude: 54.349760, longitude: 18.648074)),
        Monument(id: 6, name: "Akademia Sztuk Pięknych", description: "Description of Akademia Sztuk Pięknych", location: CLLocationCoordinate2D(latitude: 54.350799, longitude: 18.649083))
    ]

    var markerToGo: Int = 0
    var monumentMarkers: [MonumentPin] = []
    var gameId: Int

    init(gameId: Int) {
        self.gameId = gameId
    }

    func setupMapView(_ mapView: MKMapView) {
        self.mapView = mapView
    }

    func fetchMonumentsForGame() {
        //todo: load monuments from firebase
    }

    func startGame() {
        let monumentMarker = MonumentPin(monument: monuments[0])
        mapView.addAnnotation(monumentMarker)
    }

    func isAbleToOpenTask() -> Bool {
        let myCoordinates = mapView.userLocation.coordinate
        let currentMonumentCoordinates = monuments[markerToGo].location
        return isIn20MetersRange(from: myCoordinates, to: currentMonumentCoordinates)
    }

    func isIn20MetersRange(from myCoordinates: CLLocationCoordinate2D, to monumentCoordinates: CLLocationCoordinate2D) -> Bool {
        let myLocation = CLLocation(latitude: myCoordinates.latitude, longitude: myCoordinates.longitude)

        let monumentLocation = CLLocation(latitude: monumentCoordinates.latitude, longitude: monumentCoordinates.longitude)

        let distance = myLocation.distance(from: monumentLocation)
        print("Distance from marker: " + String(distance))
        return distance <= 20
    }

    func showNextMarker() {
        markerToGo += 1
        if markerToGo >= monuments.count {
            mapView.removeAnnotations(mapView!.annotations)
            showEndGameAlert()
        } else {
            showCompletedTaskAlert()
            let monumentMarker = MonumentPin(monument: monuments[markerToGo])
            mapView.removeAnnotations(mapView!.annotations)
            mapView.addAnnotation(monumentMarker)
        }
    }

    private func showEndGameAlert() {
        alertPresenter.presentInfoAlert(title: "Congratulations!", message: "You have completed that game, you are phenomenal!", completion: {
            [weak self] in
            self?.onEndGame?()
        })
    }


    func showCompletedTaskAlert() {
        StatusAlertPresenter.showStatusAlert(title: "Congratulations", message: "You completed this task. Head to the next destination")
    }
    func showTooFarFromMonumentAlert() {
        StatusAlertPresenter.showStatusAlert(title: "You are too far from the place", message: "Make sure you to be in 20 meters range!")
    }
}