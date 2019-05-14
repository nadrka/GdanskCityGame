import UIKit

extension UIView {

    func addVerticalGradientLayer(topColor:UIColor, bottomColor:UIColor) {
        let gradient = CAGradientLayer()
        gradient.colors = [
            topColor.cgColor,
            bottomColor.cgColor
        ]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)
    }
}