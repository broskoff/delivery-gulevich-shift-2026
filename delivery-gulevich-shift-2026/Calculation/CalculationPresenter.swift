import Foundation
import UIKit

protocol ICalculationPresenterOutput: AnyObject {
	func showMethodOfSend()
	
	func showCitySelection(onSelect: @escaping (String) -> ())
	func showPackageSize(onSelect: @escaping (PackageSizeItem) -> ())
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
		output?.showCitySelection { [weak self] city in
			self?.view?.updateDepartureCity(city) 
		}
	}
	
	func userDidTapDestinationCityField() {
		output?.showCitySelection { [weak self] city in
			self?.view?.updateDestinationCity(city)
		}
	}
	
	func userDidTapPackageSizeField() {
		output?.showPackageSize { [weak self] size in
			
			switch size {
			case .size(let text):
				self?.view?.updateSizePackageField(text)
			case .title:
				break
			}
		}
	}
	
	func userDidTapTrackButton() {
		print("Нажали кнопку Найти. Это напечатано из CalculationPresenter 2")
//		output?.
	}
}
