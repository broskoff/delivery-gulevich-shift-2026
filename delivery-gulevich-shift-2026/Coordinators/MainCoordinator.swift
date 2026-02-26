import Foundation
import UIKit

final class MainCoordinator: IMainCoordinator {
	
	var tabBarController: UITabBarController
	var childCoordinators: [ICoordinator] = []
	
	init(tabBarController: UITabBarController) {
		self.tabBarController = tabBarController
	}
	
	func start() {
		
		let view = CalculationView()
		let presenter = CalculationPresenter(coordinator: self)
		let calculationViewController = CalculationViewController(calculationView: view,
																  presenter: presenter)
		let calculationNavigationController = UINavigationController(rootViewController: calculationViewController)
		calculationNavigationController.tabBarItem = UITabBarItem(title: "Расчет",
																  image: UIImage(systemName: "plus.forwardslash.minus"),
																  selectedImage: nil)
		
		let profileViewController = ProfileViewController(coordinator: self)
		let profileNavigationController = UINavigationController(rootViewController: profileViewController)
		profileNavigationController.tabBarItem = UITabBarItem(title: "Профиль",
															  image: UIImage(systemName: "person.crop.circle"),
															  selectedImage: nil)
		
		let historyViewController = HistoryViewController(coordinator: self)
		let historyNavigationController = UINavigationController(rootViewController: historyViewController)
		historyNavigationController.tabBarItem = UITabBarItem(title: "История",
															  image: UIImage(systemName: "clock"),
															  selectedImage: nil)
		
		tabBarController.viewControllers = [
			calculationNavigationController,
			historyNavigationController,
			profileNavigationController
		]
	}
	
	func showMethodOfSend() {
		let coordinator = MethodOfSendCoordinator(
			parentCoordinator: self,
			navigationController: calculationNavigationController
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
}
