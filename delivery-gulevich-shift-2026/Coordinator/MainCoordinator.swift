import Foundation
import UIKit

final class MainCoordinator: ICoordinator {
	var tabBarContorller: UITabBarController?
	
	func eventOcurred(type: Event) {
		//		switch type {
		//
		//		}
	}
	
	func start() {
		
		let calculationViewController = CalculationViewController()
		calculationViewController.coordinator = self
		let calculationNavigationController = UINavigationController(rootViewController: calculationViewController)
		calculationNavigationController.tabBarItem = UITabBarItem(title: "Расчет",
																  image: UIImage(systemName: "plus.forwardslash.minus"),
																  selectedImage: nil)
		
		let profileViewController = ProfileViewController()
		profileViewController.coordinator = self
		let profileNavigationController = UINavigationController(rootViewController: profileViewController)
		profileNavigationController.tabBarItem = UITabBarItem(title: "Профиль",
															  image: UIImage(systemName: "person.crop.circle"),
															  selectedImage: nil)
		
		let historyViewController = HistoryViewController()
		historyViewController.coordinator = self
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
}
