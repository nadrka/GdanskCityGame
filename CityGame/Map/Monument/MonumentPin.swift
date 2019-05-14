import Foundation
import MapKit

class MonumentPin: NSObject, MKAnnotation{
    var monument: Monument
    private(set) var coordinate: CLLocationCoordinate2D

    init(monument: Monument) {
        self.monument = monument
        self.coordinate = monument.location
    }

}