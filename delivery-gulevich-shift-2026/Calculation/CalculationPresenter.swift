import Foundation
import UIKit

protocol ICalculationPresenterOutput: AnyObject {
	func showMethodOfSend()
}

protocol ICalculationPresenter: AnyObject {
	func userDidTapCalculateButton()
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
}
