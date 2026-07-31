import Foundation

protocol ICitySelectionPresenterOutput: AnyObject {
	func didSelectCity(_ city: String)
}

protocol ICitySelectionPresenter: AnyObject {
	func didSelectCity(_ city: String)
}

final class CitySelectionPresenter: ICitySelectionPresenter {
	
	weak var output: ICitySelectionPresenterOutput?
	var view: CitySelectionViewController?
	
	init(output: ICitySelectionPresenterOutput) {
		self.output = output
	}
	
	func didSelectCity(_ city: String) {
		output?.didSelectCity(city)
	}
}
