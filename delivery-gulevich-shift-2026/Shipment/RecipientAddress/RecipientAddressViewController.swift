import UIKit

protocol RecipientAddressViewControllerProtocol: AnyObject {
	func updateView()
}

final class RecipientAddressViewController: UIViewController {
	
	var recipientAddressContentView: UIView & RecipientAddressContentViewProtocol
	var presenter: RecipientAddressPresenterProtocol
	
	init(recipientAddressContentView: UIView & RecipientAddressContentViewProtocol,
		 presenter: RecipientAddressPresenterProtocol) {
		self.recipientAddressContentView = recipientAddressContentView
		self.presenter = presenter
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = recipientAddressContentView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		userEnteredRecipientAddress()
	}
	
	func userEnteredRecipientAddress() {
		recipientAddressContentView.completionHandler = { (street, house, apartment, note) in
			self.presenter.userEnteredAddress(street, house, apartment, note)
		}
	}
}


extension RecipientAddressViewController: RecipientAddressViewControllerProtocol {
	func updateView() {
		
	}
}
