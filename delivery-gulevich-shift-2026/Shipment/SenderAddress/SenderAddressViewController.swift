import UIKit

protocol SenderAddressViewProtocol: AnyObject {
	func updateView()
}

final class SenderAddressViewController: UIViewController {
	
	let senderAddressContentView: UIView & SenderAddressContentViewProtocol
	let presenter: SenderAddressPresenterProtocol
	
	init(
		senderAddressContentView: UIView & SenderAddressContentViewProtocol,
		presenter: SenderAddressPresenterProtocol
	) {
		self.senderAddressContentView = senderAddressContentView
		self.presenter = presenter
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		self.view = senderAddressContentView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		userEnteredAddress()
	}
	
	func userEnteredAddress() {
		senderAddressContentView.completionHandler = { (street, house, apartment, note) in
			self.presenter.userEnteredAddress(street, house, apartment, note)
		}
	}
}

extension SenderAddressViewController: SenderAddressViewProtocol {
	func updateView() {
		
	}
}
