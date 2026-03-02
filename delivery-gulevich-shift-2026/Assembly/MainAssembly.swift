import UIKit

protocol IMainAssembly: AnyObject {
	
	func buildCalculationScreen(coordinator: IMainCoordinator) -> UIViewController
	
	func buildHistoryScreen(coordinator: IMainCoordinator) -> UIViewController
	
	func buildProfileScreen(coordinator: IMainCoordinator) -> UIViewController
}

final class MainAssembly: IMainAssembly {
	
	func buildCalculationScreen(coordinator: IMainCoordinator) -> UIViewController {
		
		let calculationView = CalculationView()
		let calculationPresenter = CalculationPresenter(coordinator: coordinator)
		
		let calculationViewController = CalculationViewController(
			calculationView: calculationView,
			presenter: calculationPresenter
		)
		
		return calculationViewController
	}
	
	func buildHistoryScreen(coordinator: IMainCoordinator) -> UIViewController {
		let historyView = HistoryView()
		let historyPresenter = HistoryPresenter(coordinator: coordinator)
		let historyViewController = HistoryViewController(
			historyView: historyView,
			presenter: historyPresenter
		)
		
		return historyViewController
	}
		
	func buildProfileScreen(coordinator: IMainCoordinator) -> UIViewController {
		let profileView = ProfileView()
		let profilePresenter = ProfilePresenter(coordinator: coordinator)
		let profileViewController = ProfileViewController(
			profileView: profileView,
			profilePresenter: profilePresenter
		)
		
		return profileViewController
	}
}
