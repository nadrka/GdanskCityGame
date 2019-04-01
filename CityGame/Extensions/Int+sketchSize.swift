import UIKit

extension Int {

    var cgFloat: CGFloat {
        return CGFloat(self)
    }

    var sketchHeight: CGFloat {
        let screenHeight = Float(UIScreen.main.bounds.size.height)
        let iPhoneScreenHeight = Float(667.0)
        let scale = screenHeight / iPhoneScreenHeight
        let scaledSize = Float(self) * scale
        let result = (abs(scaledSize) <= Float(abs(self))) ? CGFloat(scaledSize) : self.cgFloat
        return result
    }

    var sketchWidth: CGFloat {
        let screenWidth = Float(UIScreen.main.bounds.size.width)
        let iPhoneScreenWidth = Float(375.0)
        let scale = screenWidth / iPhoneScreenWidth
        let scaledSize = Float(self) * scale
        let result = (abs(scaledSize) <= Float(abs(self))) ? CGFloat(scaledSize) : self.cgFloat
        return result
    }

}