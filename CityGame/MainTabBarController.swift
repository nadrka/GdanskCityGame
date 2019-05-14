import UIKit


class MainTabBarController: UITabBarController {

    private(set) var gameViewModel: GameViewModel!
    private(set) var friendsViewModel: FriendsViewModel!
    private(set) var groupsViewModel: GroupsViewModel!
    private(set) var gameNavigationController: UINavigationController!
    private(set) var friendNavigationController: UINavigationController!
    private(set) var groupNavigationController: UINavigationController!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        tabBar.tintColor = Colors.lightPurple
    }

    private func setupViewController() {
        let gameViewController = setupGameViewController()
        let friendsViewController = setupFriendsViewController()
        let groupsViewController = setupGroupsViewController()

        gameNavigationController = createNavigationController(title: "GAME".localized, rootViewController: gameViewController, image: UIImage(named: "map"))
        groupNavigationController = createNavigationController(title: "GROUPS".localized, rootViewController: groupsViewController, image: UIImage(named: "group"))
        friendNavigationController = createNavigationController(title: "FRIENDS".localized, rootViewController: friendsViewController, image: UIImage(named: "friend"))

        viewControllers = [
            gameNavigationController,
            friendNavigationController,
            groupNavigationController
        ]
    }

    private func setupGameViewController() -> GameViewController {
        gameViewModel = GameViewModel()
        let gameViewController = GameViewController(viewModel: gameViewModel)
        return gameViewController
    }

    private func setupFriendsViewController() -> FriendsTableViewController {
        friendsViewModel = FriendsViewModel()
        let friendsTableViewController = FriendsTableViewController(viewModel: friendsViewModel)
        return friendsTableViewController
    }

    private func setupGroupsViewController() -> GroupTableViewController {
        groupsViewModel = GroupsViewModel()
        let groupsTableViewController = GroupTableViewController(viewModel: groupsViewModel)
        return groupsTableViewController
    }

    private func createNavigationController(title: String, rootViewController: UIViewController, image: UIImage?) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        return navigationController
    }
}