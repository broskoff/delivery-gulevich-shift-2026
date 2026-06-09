import Foundation
import UIKit

protocol ICalculationPresenterOutput: AnyObject {
	func showMethodOfSend()
	func showCitySelection()
	func showPackageSize()
}

protocol ICalculationPresenter: AnyObject {
	func userDidTapCalculateButton()
	func userDidTapCitySelectionField()
	func userDidTapPackageSizeField()
	func userDidTapTrackButton()
}

final class CalculationPresenter: ICalculationPresenter {

	weak var output: ICalculationPresenterOutput?
	weak var view: ICalculationView?
	
	init(output: ICalculationPresenterOutput) {
		self.output = output
	}
	
	func userDidTapCalculateButton() {
		output?.showMethodOfSend()
	}
	
	func userDidTapCitySelectionField() {
		output?.showCitySelection()
	}
	
	func userDidTapPackageSizeField() {
		output?.showPackageSize()
	}
	
	func userDidTapTrackButton() {
		print("Нажали кнопку Найти. Это напечатано из CalculationPresenter 2")
//		output?.
	}
}
