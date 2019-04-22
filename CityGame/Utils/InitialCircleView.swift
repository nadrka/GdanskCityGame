import UIKit
import SnapKit

class InitialCircleView: UIView {
    private(set) var name: String
    private(set) var color: UIColor
    private(set) var fontSize: CGFloat
    private(set) var height: CGFloat

    private var initialLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(name: String, color: UIColor, fontSize: CGFloat = 16, height: CGFloat = 64) {
        self.color = color
        self.fontSize = fontSize
        self.height = height
        self.name = name
        super.init(frame: .zero)
        setupView()
        applyConstraints()
    }

    private func setupView() {
        layer.cornerRadius = height / 2
        backgroundColor = color
        setupInitialLabel()
    }

    private func setupInitialLabel() {
        initialLabel.font = UIFont.systemFont(ofSize: fontSize)
        initialLabel.text = InitialCreator.getInitials(from: name)
        addSubview(initialLabel)
    }


    private func applyConstraints() {
        initialLabel.snp.makeConstraints({
            make in
            make.center.equalToSuperview()
        })
    }
}