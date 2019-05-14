import UIKit
import SnapKit

class FriendTableViewCell: UITableViewCell {
    static let reuseId = "FriendTableViewCellReuseId"
    private(set) var viewModel: FriendCellViewModel!
    private var initialCircleView: InitialCircleView!
    private var nameLabel: UILabel!
    private var distanceLabel: UILabel?


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    func setup(_ viewModel: FriendCellViewModel) {
        self.viewModel = viewModel
        setupView()
    }

    private func setupView() {
        setupInitialsCircleView()
        setupNameLabel()
        applyConstraints()
    }

    private func setupInitialsCircleView() {
        initialCircleView = InitialCircleView(name: viewModel.friendName, color: .blue, height: 45)
        addSubview(initialCircleView)
    }

    private func setupNameLabel() {
        nameLabel = UILabel()
        nameLabel.text = viewModel.friendName
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 16)
        nameLabel.numberOfLines = 1
        addSubview(nameLabel)
    }



    private func applyConstraints() {
        initialCircleView.snp.makeConstraints {
            make in
            make.left.equalToSuperview().inset(15.sketchWidth)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(45.sketchHeight)
        }

        nameLabel.snp.makeConstraints{
            make in
            make.left.equalTo(initialCircleView.snp.right).inset(-20.sketchWidth)
            make.right.equalToSuperview().inset(20.sketchWidth)
            make.centerY.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(30.sketchHeight)
        }
    }
}