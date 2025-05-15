import UIKit

class TabBarController: UITabBarController {
    private let container: DIContainer

    init(container: DIContainer) {
        self.container = container
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }

    private func configureTabBar() {
        let bookSearchViewController = UINavigationController(rootViewController: container.makeBookSearchViewContoller())
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
