import UIKit
import SnapKit

protocol DeliveryMethodViewControllerProtocol: AnyObject {
	func updateView()
}

class DeliveryMethodViewController: UIViewController {
	
	let deliveryMethodContentView: UIView & DeliveryMethodContentViewProtocol
	let presenter: DeliveryMethodPresenterProtocol
	
	init(
		deliveryMethodContentView: UIView & DeliveryMethodContentViewProtocol,
		presenter: DeliveryMethodPresenterProtocol
	) {
		self.deliveryMethodContentView = deliveryMethodContentView
		self.presenter = presenter
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		self.view = deliveryMethodContentView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		userChoseDeliveryMethod()
	}
	
	func userChoseDeliveryMethod() {
		deliveryMethodContentView.completionHandler = { [weak self] (type, price, days) in
			self?.presenter.userChoseDeliveryMethod(type: type, price: price, days: days)
		}
	}
}

extension DeliveryMethodViewController: DeliveryMethodViewControllerProtocol {
	func updateView() {
		
	}
}
