import Foundation
import MapKit

class MapViewModel {
    private var mapView: MKMapView!

    var onTaskButtonTapped: (()->())? = nil
    var onDetailsButtonTapped: (()->())? = nil

    var monuments: [Monument] = [
        Monument(id: 1, name: "Bazylika Mariacks", description: "", location: CLLocationCoordinate2D(latitude: 54.349822, longitude: 18.653242)),
        Monument(id: 2, name: "Dwór Artusa", description: "", location: CLLocationCoordinate2D(latitude: 54.348850, longitude: 18.653394)),
        Monument(id: 3, name: "Fontanna Neptuna", description: "", location: CLLocationCoordinate2D(latitude: 54.348628, longitude: 18.653216)),
        Monument(id: 4, name: "Żuraw", description: "", location: CLLocationCoordinate2D(latitude: 54.350605, longitude: 18.657509)),
        Monument(id: 5, name: "Złota Brama", description: "", location: CLLocationCoordinate2D(latitude: 54.349760, longitude: 18.648074)),
        Monument(id: 6, name: "Akademia Sztuk Pięknych", description: "", location: CLLocationCoordinate2D(latitude: 54.350799, longitude: 18.649083))
    ]

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
        createMarkerForMonuments()
    }


    private func createMarkerForMonuments() {
        monuments.forEach({
            let monumentPin = MonumentPin(monument: $0)
            monumentMarkers.append(monumentPin)
            mapView.addAnnotation(monumentPin)
        })
    }
}