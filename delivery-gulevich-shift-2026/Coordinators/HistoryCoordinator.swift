import UIKit

final class HistoryCoordinator: ICoordinator {
	
	let navigationController: UINavigationController
	let assembly: IMainAssembly
	
	init(navigationController: UINavigationController, assembly: IMainAssembly) {
		self.navigationController = navigationController
		self.assembly = assembly
	}
	
	func start() {
		let historyViewController = assembly.buildHistoryScreen(output: self)
		navigationController.viewControllers = [historyViewController]
		navigationController.tabBarItem = UITabBarItem(
			title: UIConstants.TabBarItem.title.history,
			image: UIImage(systemName: UIConstants.TabBarItem.image.history),
			selectedImage: nil
		)
	}
}

extension HistoryCoordinator: IHistoryPresenterOutput {
	
}
