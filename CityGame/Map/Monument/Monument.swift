import Foundation
import MapKit

struct Monument {
    private(set) var id: Int = 0
    private(set) var name: String
    private(set) var description: String
    private(set) var location: CLLocationCoordinate2D
}