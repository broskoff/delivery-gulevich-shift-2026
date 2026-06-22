import Foundation
import UIKit

protocol ICalculationPresenterOutput: AnyObject {
	func showMethodOfSend()
	func showPackageSize()
	
	func showCitySelection()
}

protocol ICalculationPresenter: AnyObject {
	func userDidTapCalculateButton()
	func userDidTapDepartureCityField()
	func userDidTapDestinationCityField()
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
	
	func userDidTapDepartureCityField() {
		output?.showCitySelection()
	}
	
	func userDidTapDestinationCityField() {
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

extension CalculationPresenter: CalculationPresenterInputProtocol {
	func didSelectedDepartureCity(_ city: String) {
//		view?.updateDepartureCity(city) пример на будущее
		print(city)
	}
	
	
}
