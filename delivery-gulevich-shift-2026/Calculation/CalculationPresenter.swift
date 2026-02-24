import Foundation
import UIKit

protocol ICalculationPresenter: AnyObject {
	
	func didTapCalculateButton()
}

class CalculationPresenter: ICalculationPresenter {
	
	weak var coordinator: IMainCoordinator?
	
	init(coordinator: IMainCoordinator) {
		self.coordinator = coordinator
	}
	
	func didTapCalculateButton() {
		coordinator?.showMethodOfSend()
	}
}
