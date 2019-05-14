import UIKit
import SnapKit

class CreateGroupButtonView: UIView {
    private var plusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "add-group")
        return imageView
    }()

    private var createGroupLabel: UILabel = {
        let label = UILabel()
        label.text = "CREATE_GROUP".localized
        label.textColor = Colors.lightPurple
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero)
        setupView()
        applyConstraints()
    }

    private func setupView() {
        backgroundColor = Colors.lightGray
        addSubview(plusImageView)
        addSubview(createGroupLabel)
    }

    private func applyConstraints() {
        plusImageView.snp.makeConstraints {
            make in
            make.left.equalToSuperview().inset(20.sketchWidth)
            make.height.equalTo(30.sketchHeight)
            make.width.equalTo(30.sketchHeight)
            make.centerY.equalToSuperview()
        }
        createGroupLabel.snp.makeConstraints{
            make in
            make.left.equalTo(plusImageView.snp.right).inset(-15.sketchWidth)
            make.centerY.equalToSuperview()
        }
    }
}