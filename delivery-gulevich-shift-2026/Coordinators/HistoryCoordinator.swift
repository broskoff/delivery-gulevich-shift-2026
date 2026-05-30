import UIKit

final class HistoryCoordinator: CoordinatorProtocol {
	
	let navigationController: UINavigationController
	let assembly: MainAssemblyProtocol
	
	init(navigationController: UINavigationController, assembly: MainAssemblyProtocol) {
		self.navigationController = navigationController
		self.assembly = assembly
	}
	
	func start() {
		let historyViewController = assembly.buildHistoryScreen(output: self)
		navigationController.viewControllers = [historyViewController]
		navigationController.tabBarItem = UITabBarItem(
			title: UIConstants.TabBarItem.Title.history,
			image: UIImage(systemName: UIConstants.TabBarItem.Image.history),
			selectedImage: nil
		)
	}
}

extension HistoryCoordinator: IHistoryPresenterOutput {
	
}
