import UIKit

protocol IMainAssembly: AnyObject {
	
	func buildCalculationScreen(coordinator: IMainCoordinator) -> UIViewController
	
	func buildHistoryScreen(coordinator: IMainCoordinator) -> UIViewController
	
	func buildProfileScreen(coordinator: IMainCoordinator) -> UIViewController
}

final class MainAssembly: IMainAssembly {
	
	func buildCalculationScreen(coordinator: IMainCoordinator) -> UIViewController {
		let calculationPresenter = CalculationPresenter(coordinator: coordinator)
		let calculationContentView = CalculationContentView()
		let calculationView = CalculationViewController(
			calculationContentView: calculationContentView,
			presenter: calculationPresenter
		)
		
		calculationPresenter.view = calculationView
		return calculationView
	}
	
	func buildHistoryScreen(coordinator: IMainCoordinator) -> UIViewController {
		let historyPresenter = HistoryPresenter(coordinator: coordinator)
		let historyContentView = HistoryContentView()
		let historyView = HistoryViewController(
			historyContentView: historyContentView,
			presenter: historyPresenter
		)
		
		historyPresenter.view = historyView
		return historyView
	}
		
	func buildProfileScreen(coordinator: IMainCoordinator) -> UIViewController {
		let profilePresenter = ProfilePresenter(coordinator: coordinator)
		let profileContentView = ProfileContentView()
		let profileView = ProfileViewController(
			profileContentView: profileContentView,
			presenter: profilePresenter
		)
		
		profilePresenter.view = profileView
		return profileView
	}
}
