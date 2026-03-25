import Foundation

//переименовать userDidFinish() когда появится конкретное действие
protocol ICitySelectionPresenterOutput: AnyObject {
	func userDidFinish()
}

//переименовать userActed() когда появится конкретное действие
protocol ICitySelectionPresenter: AnyObject {
	func userActed()
}

final class CitySelectionPresenter: ICitySelectionPresenter {
	
	var output: ICitySelectionPresenterOutput?
	var view: CitySelectionViewController?
	
	init(output: ICitySelectionPresenterOutput) {
		self.output = output
	}
	
	func userActed() {
		output?.userDidFinish()
	}
}
