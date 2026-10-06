import UIKit

protocol PaymentDeliveryViewControllerProtocol: AnyObject {
	func updateView()
}

final class PaymentDeliveryViewController: UIViewController {
	
	var paymentDeliveryContentView: UIView & PaymentDeliveryContentViewProtocol
	var presenter: PaymentDeliveryPresenterProtocol
	
	init(paymentDeliveryContentView: UIView & PaymentDeliveryContentViewProtocol,
		 presenter: PaymentDeliveryPresenterProtocol) {
		self.paymentDeliveryContentView = paymentDeliveryContentView
		self.presenter = presenter
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = paymentDeliveryContentView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		userChoisePayment()
	}
	
	func userChoisePayment() {
		paymentDeliveryContentView.completionHandler = { [weak self] payer in
			self?.presenter.userChoisePayment(payer)
		}
	}
}

extension PaymentDeliveryViewController: PaymentDeliveryViewControllerProtocol {
	func updateView() {
		
	}
}
