import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        figureTabBar()
    }

    private func figureTabBar() {
        let bookSearchViewController = UINavigationController(rootViewController: BookSearchViewController())
        let bookCartViewController = UINavigationController(rootViewController: BookCartViewController())

        bookSearchViewController.tabBarItem = UITabBarItem(
            title: "Search Tab",
            image: UIImage(systemName: "magnifyingglass"),
            selectedImage: nil
        )

        bookCartViewController.tabBarItem = UITabBarItem(
            title: "Cart Tab",
            image: UIImage(systemName: "cart"),
            selectedImage: nil
        )

        setViewControllers([bookSearchViewController, bookCartViewController], animated: false)
    }
}
