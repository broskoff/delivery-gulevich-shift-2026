import UIKit

protocol ICalculationView : AnyObject {
	func updateView()
}

class CalculationViewController: UIViewController, ICalculationContentViewDelegate {
	
	private let calculationContentView: UIView & ICalculationContentView
	let presenter: ICalculationPresenter
	
	init(
		calculationContentView: UIView & ICalculationContentView,
		presenter: ICalculationPresenter
	) {
		self.calculationContentView = calculationContentView
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		self.view = calculationContentView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		calculationContentView.delegate = self
	}
	
	func didTapButtonCalcDelivery() {
		presenter.userDidTapCalculateButton()
	}
}

extension CalculationViewController: ICalculationView {
	func updateView() {

	}
}
