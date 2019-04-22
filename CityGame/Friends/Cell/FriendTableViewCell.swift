import UIKit

class FriendTableViewCell: UITableViewCell {
    static let reuseId = "FriendTableViewCellReuseId"
    private(set) var viewModel: FriendCellViewModel!
    private var initialCircleView: InitialCircleView!
    private var nameLabel: UILabel!
    private var distanceLabel: UILabel!


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
        addSubviews()
        applyConstraints()
    }

    private func addSubviews() {

    }

    private func applyConstraints() {

    }
}