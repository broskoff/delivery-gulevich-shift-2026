import UIKit

protocol CalculationAssemblyProtocol: AnyObject {
	func build(output: ICalculationPresenterOutput) -> UIViewController
}

final class CalculationAssembly: CalculationAssemblyProtocol {
	func build(output: ICalculationPresenterOutput) -> UIViewController {
		let calculationPresenter = CalculationPresenter(output: output)
		let calculationContentView = CalculationContentView()
		let calculationView = CalculationViewController(
			calculationContentView: calculationContentView,
			presenter: calculationPresenter
		)
		
		calculationPresenter.view = calculationView
		return calculationView
	}
}
