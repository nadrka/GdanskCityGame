import UIKit

class FriendsTableViewController: UITableViewController {

    let friends = [Friend(name: "Gustaw Ohler"), Friend(name: "Łukasz Pawlicki")]
    let searchController = UISearchController(searchResultsController: nil)

    override func loadView() {
        super.loadView()
        setupTableView()
        setupSearchBar()
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
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.reuseId, for: indexPath) as! FriendTableViewCell
        let friend = friends[indexPath.row]
        let cellViewModel = FriendCellViewModel(cellUsage: .friendsSharingLocation, friend: friend)
        cell.setup(cellViewModel)
        return cell
    }
}
