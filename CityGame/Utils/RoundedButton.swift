import UIKit

class RoundedButton: UIButton {
    private var hasBorder: Bool
    private var color: UIColor
    private var frameColor: UIColor?
    private var titleColor: UIColor
    private var buttonTitle: String

    required init?(coder aDecoder: NSCoder) {
        fatalError("coder not implemented")
    }

    init(hasFrame: Bool = false, buttonTitle: String, color: UIColor, frameColor: UIColor? = nil, titleColor: UIColor = .white) {
        self.hasBorder = hasFrame
        self.buttonTitle = buttonTitle
        self.color = color
        self.frameColor = frameColor
        self.titleColor = titleColor
        super.init(frame: .zero)
        setupLayout()
    }

    private func setupLayout() {
        layer.cornerRadius = 25
        backgroundColor = color
        setTitle(buttonTitle, for: .normal)
        setTitleColor(titleColor, for: .normal)
        if hasBorder {
            setupBorder()
        }
    }

    private func setupBorder() {
        layer.borderWidth = 1
        guard let colorOfFrame = frameColor else {
            return
        }
        layer.borderColor = colorOfFrame.cgColor
    }
}