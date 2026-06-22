import Foundation

//переименовать userDidFinish() когда появится конкретное действие
protocol ICitySelectionPresenterOutput: AnyObject {
	func userDidFinish()
	
	func didSelectCity(_ city: String)
}

//переименовать userActed() когда появится конкретное действие
protocol ICitySelectionPresenter: AnyObject {
	func userActed()
	func didSelectCity(_ city: String)
}

final class CitySelectionPresenter: ICitySelectionPresenter {
	
	weak var output: ICitySelectionPresenterOutput?
	var view: CitySelectionViewController?
	
	init(output: ICitySelectionPresenterOutput) {
		self.output = output
	}
	
	func userActed() {
		output?.userDidFinish()
	}
	
	func didSelectCity(_ city: String) {
		output?.didSelectCity(city)
	}
}
