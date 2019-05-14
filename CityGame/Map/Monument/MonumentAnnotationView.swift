import Foundation
import MapKit

class MonumentAnnotationView: MKAnnotationView {

    var monument: Monument?

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(annotation: MKAnnotation?, reuseIdentifier: String, monument: Monument? = nil) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        self.isDraggable = false
        self.isEnabled = true
        self.isHighlighted = true
        self.monument = monument
        createAnnotationView(annotation: annotation)
    }

    private func createAnnotationView(annotation: MKAnnotation?) {
        guard let strongAnnotation = annotation as? MonumentPin else {
            return
        }

        canShowCallout = true
        image = UIImage(named: "monument-marker")
        let view = MonumentDetailsView()
        view.isUserInteractionEnabled = true
        detailCalloutAccessoryView = view
        detailCalloutAccessoryView?.isUserInteractionEnabled = true

    }
}