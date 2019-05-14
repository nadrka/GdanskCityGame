import UIKit
import SnapKit

class CreateGroupView: UIView {
    private var viewModel: CreateGroupViewModel
    private(set) var tableView: UITableView!
    private(set) var createGroupButton: RoundedButton!

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(viewModel: CreateGroupViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupView()
        applyConstraints()
    }


    private func setupView() {
        backgroundColor = .white
        setupTableView()
        setupCreateGroupButton()
    }

    private func setupTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FriendTableViewCell.self, forCellReuseIdentifier: FriendTableViewCell.reuseId)
        tableView.tableFooterView = UIView()
        addSubview(tableView)
    }

    private func setupCreateGroupButton() {
        createGroupButton = RoundedButton(buttonTitle: "CREATE".localized, color: Colors.lightPurple)
        createGroupButton.addTarget(self, action: #selector(onCreateGroupTapped), for: .touchUpInside)
        addSubview(createGroupButton)
    }

    @objc func onCreateGroupTapped() {
        viewModel.onCreateGroupTapped()
    }

    private func applyConstraints() {
        tableView.snp.makeConstraints {
            make in
            make.width.equalToSuperview()
            make.top.equalTo(self.snp_topMargin).inset(15.sketchHeight)
            make.bottom.equalTo(createGroupButton.snp.top)
        }

        createGroupButton.snp.makeConstraints {
            make in
            make.width.equalToSuperview().inset(15.sketchWidth)
            make.height.equalTo(55.sketchHeight)
            make.bottom.equalTo(self.snp_bottomMargin).inset(10.sketchHeight)
            make.centerX.equalToSuperview()
        }

    }
}

extension CreateGroupView: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfFriends()
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.reuseId, for: indexPath) as! FriendTableViewCell
        let friend = viewModel.getFriend(for: indexPath.row)
        let cellViewModel = DefaultFriendCellViewModel(cellUsage: .friendsPicker, friend: friend)
        viewModel.cellViewModels.append(cellViewModel)
        cell.setup(cellViewModel)
        return cell
    }
}