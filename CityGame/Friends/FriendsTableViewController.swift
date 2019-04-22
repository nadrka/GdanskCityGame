import UIKit

class FriendsTableViewController: UITableViewController {

    let friends = [Friend(name: "Gucio"), Friend(name: "Karol")]
    let searchController = UISearchController(searchResultsController: nil)
    let cellId = "cellId"

    override func loadView() {
        super.loadView()
        setupTableView()
        setupSearchBar()
    }

    private func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false
    }

    private func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let friend = friends[indexPath.row]
        cell.textLabel?.text = friend.name
        return cell
    }
}
