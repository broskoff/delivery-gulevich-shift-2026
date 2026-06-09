import UIKit

protocol ICalculationView : AnyObject {
	func updateView()
}

final class CalculationViewController: UIViewController {
		
	private let calculationContentView: UIView & ICalculationContentView
	private let presenter: ICalculationPresenter
	
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
		configureBackButtonTitle()
	}
	
	private func configureBackButtonTitle() {
		navigationItem.backButtonDisplayMode = .minimal
	}
}

extension CalculationViewController: ICalculationContentViewDelegate {
	func didTapCalculateDelivery() {
		presenter.userDidTapCalculateButton()
	}
	
	func didTapTrackParcel() {
		print("Нажали кнопку Найти. Это напечатано из CalculationViewController 1")
		presenter.userDidTapTrackButton()
	}
	
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
