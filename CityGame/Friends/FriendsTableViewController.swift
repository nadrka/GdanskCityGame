import UIKit

class FriendsTableViewController: UITableViewController {

    let searchController = UISearchController(searchResultsController: nil)
    var viewModel: FriendsViewModel

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(viewModel: FriendsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    override func loadView() {
        super.loadView()
        setupTableView()
        setupSearchBar()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func setupTableView() {
        tableView.register(FriendTableViewCell.self, forCellReuseIdentifier: FriendTableViewCell.reuseId)
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false
//        tableView.separatorStyle = .none
    }

    private func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.reuseId, for: indexPath) as! FriendTableViewCell
        let friend = viewModel.friends[indexPath.row]
        let cellViewModel = DefaultFriendCellViewModel(cellUsage: .friendsToShareLocation, friend: friend)
        cell.setup(cellViewModel)
        return cell
    }
}
