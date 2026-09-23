import Foundation
import UIKit

final class TabBarCoordinator {
	
	private(set) var tabBarController = UITabBarController()
	private var coordinators: [CoordinatorProtocol] = []
	
	private let calculationAssembly: CalculationAssemblyProtocol 
	private let historyAssembly: HistoryAssemblyProtocol
	private let profileAssembly: ProfileAssemblyProtocol
	
	init(
		calculationAssembly: CalculationAssemblyProtocol,
		 historyAssembly: HistoryAssemblyProtocol,
		 profileAssembly: ProfileAssemblyProtocol
	) {
		self.calculationAssembly = calculationAssembly
		self.historyAssembly = historyAssembly
		self.profileAssembly = profileAssembly
	}
	
	func start() {
		showTabBarController()
	}
	
	private func showTabBarController() {
		let calculationNavigationController = UINavigationController()
		let historyNavigationController = UINavigationController()
		let profileNavigationController = UINavigationController()
		
		tabBarController.viewControllers = [
			calculationNavigationController,
			historyNavigationController,
			profileNavigationController
		]
		
		let calculationCoordinator = CalculationCoordinator(
			navigationController: calculationNavigationController,
			assembly: calculationAssembly
		)
		let historyCoordinator = HistoryCoordinator(
			navigationController: historyNavigationController,
			assembly: historyAssembly
		)
		let profileCoordinator = ProfileCoordinator(
			navigationController: profileNavigationController,
			assembly: profileAssembly
		)
		
		coordinators = [
			calculationCoordinator,
			historyCoordinator,
			profileCoordinator
		]
		
		calculationCoordinator.start()
		historyCoordinator.start()
		profileCoordinator.start()
	}
	
	deinit {
		print("TabBarCoordinator деинициализирован")
	}
}
