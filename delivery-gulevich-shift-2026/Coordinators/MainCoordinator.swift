import Foundation
import UIKit

final class MainCoordinator: IMainCoordinator {
	var tabBarContorller: UITabBarController?
	
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
		
		tabBarContorller?.viewControllers = [
			calculationNavigationController,
			historyNavigationController,
			profileNavigationController
		]
	}
	
	func showMethodOfSend() {
		guard let nav = tabBarContorller?.selectedViewController as? UINavigationController else { return }
		
		let coordinator = MethodOfSendCoordinator()
		coordinator.navigationController = nav
		coordinator.showMethodOfSend()
	}
}
