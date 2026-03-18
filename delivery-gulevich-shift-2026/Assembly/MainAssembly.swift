import UIKit

protocol IMainAssembly: AnyObject {
	
	func buildCalculationScreen(output: ICalculationPresenterOutput) -> UIViewController
	
	func buildHistoryScreen(output: IHistoryPresenterOutput) -> UIViewController
	
	func buildProfileScreen(output: IProfilePresenterOutput) -> UIViewController
}

final class MainAssembly: IMainAssembly {
	
	func buildCalculationScreen(output: ICalculationPresenterOutput) -> UIViewController {
		let calculationPresenter = CalculationPresenter(output: output)
		let calculationContentView = CalculationContentView()
		let calculationView = CalculationViewController(
			calculationContentView: calculationContentView,
			presenter: calculationPresenter
		)
		
		calculationPresenter.view = calculationView
		return calculationView
	}
	
	func buildHistoryScreen(output: IHistoryPresenterOutput) -> UIViewController {
		let historyPresenter = HistoryPresenter(output: output)
		let historyContentView = HistoryContentView()
		let historyView = HistoryViewController(
			historyContentView: historyContentView,
			presenter: historyPresenter
		)
		
		historyPresenter.view = historyView
		return historyView
	}
		
	func buildProfileScreen(output: IProfilePresenterOutput) -> UIViewController {
		let profilePresenter = ProfilePresenter(output: output)
		let profileContentView = ProfileContentView()
		let profileView = ProfileViewController(
			profileContentView: profileContentView,
			profilePresenter: profilePresenter
		)
		
		profilePresenter.view = profileView
		return profileView
	}
}
