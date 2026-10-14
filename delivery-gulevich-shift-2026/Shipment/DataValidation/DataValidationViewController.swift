import UIKit

protocol DataValidationViewControllerProtocol: AnyObject {
	func showData(_ data: DataToDelivery)
}

final class DataValidationViewController: UIViewController {
	
	private var dataValidationContentView: UIView & DataValidationContentViewProtocol
	private var presenter: DataValidationPresenterProtocol
	
	init(dataValidationContentView: UIView & DataValidationContentViewProtocol,
		 presenter: DataValidationPresenterProtocol) {
		self.dataValidationContentView = dataValidationContentView
		self.presenter = presenter
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = dataValidationContentView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		presenter.viewDidLoad()
		userDidTapCheckoutButton()
	}
	
	private func userDidTapCheckoutButton() {
		dataValidationContentView.onTap = { [weak self] in
			self?.presenter.userDidTapCheckoutButton()
		}
	}
}

extension DataValidationViewController: DataValidationViewControllerProtocol {
	func showData(_ data: DataToDelivery) {
		dataValidationContentView.showData(data)
	}
}
