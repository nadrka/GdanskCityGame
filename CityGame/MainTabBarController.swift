import UIKit


class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        tabBar.tintColor = Colors.mainBlue
    }

    private func setupViewController() {
        let mapViewController = MapViewController()
        let friendsViewController = FriendsTableViewController()
        let groupsViewController = GroupTableViewController()
        viewControllers = [
            createNavigationController(title: "MAP".localized, rootViewController: mapViewController, image: UIImage(named: "downloads")),
            createNavigationController(title: "FRIENDS".localized, rootViewController: friendsViewController, image: UIImage(named: "downloads")),
            createNavigationController(title: "GROUPS".localized, rootViewController: groupsViewController, image: UIImage(named: "search")),
        ]
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