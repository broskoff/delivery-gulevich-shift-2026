import UIKit

class CalculationViewController: UIViewController, ICalculationViewDelegate {
	
	let calculationView: CalculationView
	let presenter: ICalculationPresenter
	
	init(
		calculationView: CalculationView,
		presenter: ICalculationPresenter,
	) {
		self.calculationView = calculationView
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		self.view = calculationView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		calculationView.delegate = self
	}
	
	func didTapButtonCalcDelivery() {
		presenter.didTapCalculateButton()
	}
}
