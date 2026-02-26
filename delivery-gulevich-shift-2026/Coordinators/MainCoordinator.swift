import Foundation
import UIKit

final class MainCoordinator: IMainCoordinator {
	
	var tabBarController: UITabBarController
	var childCoordinators: [ICoordinator] = []
	
	private let calculationNavigationController = UINavigationController()
	private let profileNavigationController = UINavigationController()
	private let historyNavigationController = UINavigationController()
	
	init(tabBarController: UITabBarController) {
		self.tabBarController = tabBarController
	}
	
	func start() {
		
		let calculationView = CalculationView()
		let calculationPresenter = CalculationPresenter(coordinator: self)
		let calculationViewController = CalculationViewController(calculationView: calculationView,
																  presenter: calculationPresenter)
		calculationNavigationController.viewControllers = [calculationViewController]
		calculationNavigationController.tabBarItem = UITabBarItem(title: "Расчет",
																  image: UIImage(systemName: "plus.forwardslash.minus"),
																  selectedImage: nil)
		
		let historyView = HistoryView()
		let historyPresenter = HistoryPresenter(coordinator: self)
		let historyViewController = HistoryViewController(historyView: historyView, presenter: historyPresenter)
		historyNavigationController.viewControllers = [historyViewController]
		historyNavigationController.tabBarItem = UITabBarItem(title: "История",
															  image: UIImage(systemName: "clock"),
															  selectedImage: nil)
		
		let profileView = ProfileView()
		let profilePresenter = ProfilePresenter(coordinator: self)
		let profileViewController = ProfileViewController(profileView: profileView, profilePresenter: profilePresenter)
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
	
	deinit {
		print("MainCoordinator деинициализирован")
	}
}
