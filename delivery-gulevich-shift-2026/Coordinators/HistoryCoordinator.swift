import UIKit

final class HistoryCoordinator: ICoordinator {
	
	var navigationController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		let assembly = MainAssembly()
		let historyViewController = assembly.buildHistoryScreen(coordinator: self)
		navigationController.viewControllers = [historyViewController]
		navigationController.tabBarItem = UITabBarItem(title: "История",
																	  image: UIImage(systemName: "clock"),
																	  selectedImage: nil)
	}
}
