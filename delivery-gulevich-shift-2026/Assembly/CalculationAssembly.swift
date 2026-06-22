import UIKit

protocol CalculationAssemblyProtocol: AnyObject {
	func build(output: ICalculationPresenterOutput) -> (
		view: UIViewController,
		presenterInput: CalculationPresenterInputProtocol
	)
}

final class CalculationAssembly: CalculationAssemblyProtocol {
	func build(output: ICalculationPresenterOutput) -> (view: UIViewController,
														presenterInput: CalculationPresenterInputProtocol) {
		let calculationPresenter = CalculationPresenter(output: output)
		let calculationContentView = CalculationContentView()
		let calculationView = CalculationViewController(
			calculationContentView: calculationContentView,
			presenter: calculationPresenter
		)
		
		calculationPresenter.view = calculationView
		return (view: calculationView, presenterInput: calculationPresenter)
	}
}
