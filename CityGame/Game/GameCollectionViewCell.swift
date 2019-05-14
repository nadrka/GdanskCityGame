import Foundation
import UIKit
import SnapKit

class GameCollectionViewCell: UICollectionViewCell {
    static let reusableID = "GameCollectionViewCell"

    private var appNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hexString: "#666666")
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        label.text = "GAME_NAME".localized
        return label
    }()

    private var sculptureImageView: UIImageView!

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupView()
    }

    private func setupLayout() {
        layer.cornerRadius = 8
        backgroundColor = UIColor(hexString: "#cccccc")
    }

    private func setupView() {
        addSubview(appNameLabel)
        setupSculptureImageView()
        applyConstraints()
    }

    private func setupSculptureImageView() {
        let image = UIImage(named: "sculpture")
        sculptureImageView = UIImageView(image: image)
        addSubview(sculptureImageView)
    }


    private func applyConstraints() {
        sculptureImageView.snp.makeConstraints{
            make in
            make.top.equalToSuperview().inset(18.sketchHeight)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(70.sketchHeight)
        }
        appNameLabel.snp.makeConstraints {
            make in
            make.top.equalTo(sculptureImageView.snp.bottom).inset(-15.sketchHeight)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
    }

    func updateCell(gameName: String, gameNumber: Int) {
        appNameLabel.text = gameName
    }



}


