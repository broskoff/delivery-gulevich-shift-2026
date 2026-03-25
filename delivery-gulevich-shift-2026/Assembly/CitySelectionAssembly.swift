import UIKit

protocol ICitySelectionAssembly: AnyObject {
	
	func createScreen(output: ICitySelectionPresenterOutput) -> UIViewController
}

final class CitySelectionAssembly: ICitySelectionAssembly {
	
	func createScreen(output: ICitySelectionPresenterOutput) -> UIViewController {
		let presenter = CitySelectionPresenter(output: output)
		let citySelectionContentView = CitySelectionContentView()
		let citySelectionView = CitySelectionViewController(
			citySelectionContentView: citySelectionContentView,
			presenter: presenter
		)
		
		presenter.view = citySelectionView
		return citySelectionView
	}
}
