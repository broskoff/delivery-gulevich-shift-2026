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
		
		let backButton = UIBarButtonItem(
				image: UIImage(systemName: ""),
				style: .plain,
				target: nil,
				action: nil
			)
			
			navigationItem.backBarButtonItem = backButton
	}
	
	func didTapButtonCalcDelivery() {
		presenter.userDidTapCalculateButton()
	}
	
	func didTapButtonTrack() {
		presenter.userDidTapCitySelectionField()
	}
}

extension CalculationViewController: ICustomControlField {
	
	func didTapCitySelectedField() {
		presenter.userDidTapCitySelectionField()
	}
	
	func didTapPackageSizeField() {
		//как запрезентить экран PackageSizeViewController
      presenter.userDidTapPackageSizeField()
	}
}

extension CalculationViewController: ICalculationView {
	func updateView() {

	}
}
