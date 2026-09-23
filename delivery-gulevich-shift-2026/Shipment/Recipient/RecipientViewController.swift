import UIKit

protocol RecipientViewControllerProtocol: AnyObject  {
	func updateView()
}

final class RecipientViewController: UIViewController {
	
	var recipientContentView: UIView & RecipientContentViewProtocol
	let presenter: RecipientPresenterProtocol
	
	init(
		recipientContentView: UIView & RecipientContentViewProtocol,
		presenter: RecipientPresenterProtocol
	) {
		self.recipientContentView = recipientContentView
		self.presenter = presenter
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		self.view = recipientContentView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		userEnteredRecipientData()
	}
	
	func userEnteredRecipientData() {
		recipientContentView.completionHandler = { [weak self] (surname, name, patronymic, phone) in
			self?.presenter.userEnteredRecipientData(surname: surname, name: name, patronymic: patronymic, phone: phone)
		}
	}
}

extension RecipientViewController: RecipientViewControllerProtocol {
	func updateView() {
		
	}
}
