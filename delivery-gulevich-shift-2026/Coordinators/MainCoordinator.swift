import Foundation
import UIKit

final class MainCoordinator {
	
	private(set) var tabBarController = UITabBarController()
	private let assembly = MainAssembly()
	private var coordinators: [CoordinatorProtocol] = []
	
	func start() {
		showTabBarContorller()
	}
	
	private func showTabBarContorller() {
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
	}
	
	deinit {
		print("MainCoordinator деинициализирован")
	}
}
