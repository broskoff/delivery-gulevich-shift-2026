import Foundation
import UIKit

final class MainCoordinator: IMainCoordinator {
	
	let assembly: IMainAssembly
	var tabBarController: UITabBarController
	var childCoordinators: [ICoordinator] = []
	
	private let calculationNavigationController = UINavigationController()
	private let profileNavigationController = UINavigationController()
	private let historyNavigationController = UINavigationController()
	
	init(assembly: IMainAssembly, tabBarController: UITabBarController) {
		self.assembly = assembly
		self.tabBarController = tabBarController
	}
	
	func start() {
	
		let calculationViewController = assembly.buildCalculationScreen(coordinator: self)
		calculationNavigationController.viewControllers = [calculationViewController]
		calculationNavigationController.tabBarItem = UITabBarItem(title: "Расчет",
																  image: UIImage(systemName: "plus.forwardslash.minus"),
																  selectedImage: nil)
		
		let historyViewController = assembly.buildHistoryScreen(coordinator: self)
		historyNavigationController.viewControllers = [historyViewController]
		historyNavigationController.tabBarItem = UITabBarItem(title: "История",
															  image: UIImage(systemName: "clock"),
															  selectedImage: nil)
		
		let profileViewController = assembly.buildProfileScreen(coordinator: self)
		profileNavigationController.viewControllers = [profileViewController]
		profileNavigationController.tabBarItem = UITabBarItem(title: "Профиль",
															  image: UIImage(systemName: "person.crop.circle"),
															  selectedImage: nil)
		
		tabBarController.viewControllers = [
			calculationNavigationController,
			historyNavigationController,
			profileNavigationController
		]
	}
	
	func showMethodOfSend() {
		//TODO: разобраться, оставить здесь создание methodOfSendAssembly или это в другом месте создается?
		let methodOfSendAssembly = MethodOfSendAssembly()
		let coordinator = MethodOfSendCoordinator(
			parentCoordinator: self,
			navigationController: calculationNavigationController,
			methodOfSendAssembly: methodOfSendAssembly
		)
		childCoordinators.append(coordinator)
		coordinator.start()
	}
	
	func childDidFinish(child: ICoordinator?) {
		for (index, coordinator) in childCoordinators.enumerated() {
			if coordinator === child {
				childCoordinators.remove(at: index)
				break
			}
		}
	}
	
	deinit {
		print("MainCoordinator деинициализирован")
	}
}
