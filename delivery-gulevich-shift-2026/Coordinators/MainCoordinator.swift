import Foundation
import UIKit

final class MainCoordinator {
	
	let assembly = MainAssembly()
	private var coordinators: [ICoordinator] = []
	
	func start() -> UITabBarController {
		
		let tabBarController = UITabBarController()
		
		let calculationNavigationController = UINavigationController()
		let historyNavigationController = UINavigationController()
		let profileNavigationController = UINavigationController()
		
		let calculationCoordinator = CalculationCoordinator(
			navigationController: calculationNavigationController,
			assembly: assembly
		)
		let historyCoordinator = HistoryCoordinator(
			navigationController: historyNavigationController,
			assembly: assembly
		)
		let profileCoordinator = ProfileCoordinator(
			navigationController: profileNavigationController,
			assembly: assembly
		)
		
		coordinators = [
			calculationCoordinator,
			historyCoordinator,
			profileCoordinator
		]
		
		calculationCoordinator.start()
		historyCoordinator.start()
		profileCoordinator.start()
		
		tabBarController.viewControllers = [
			calculationNavigationController,
			historyNavigationController,
			profileNavigationController
		]
		
		return tabBarController
	}
	
	deinit {
		print("MainCoordinator деинициализирован")
	}
}
