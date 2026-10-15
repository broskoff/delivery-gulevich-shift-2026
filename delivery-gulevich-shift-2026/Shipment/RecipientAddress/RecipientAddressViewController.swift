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
		configureInfoTap()
	}
	
	private func userEnteredRecipientAddress() {
		recipientAddressContentView.completionHandler = {
			[weak self] (street, house, apartment, note, leaveAtTheDoor) in
			self?.presenter.userEnteredAddress(street, house, apartment, note, leaveAtTheDoor)
		}
	}
	
	private func configureInfoTap() {
		recipientAddressContentView.onInfoTap = { [weak self] in
			self?.showLeaveAtTheDoorInfo()
		}
	}
	
	private func showLeaveAtTheDoorInfo() {
		let leaveAtTheDoorInfoViewController = LeaveAtTheDoorInfoViewController()
		leaveAtTheDoorInfoViewController.modalPresentationStyle = .custom
		
		present(leaveAtTheDoorInfoViewController, animated: true)
	}
}

extension RecipientAddressViewController: RecipientAddressViewControllerProtocol {
	func updateView() {
		
	}
}
