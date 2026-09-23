import UIKit

protocol SenderViewControllerProtocol: AnyObject  {
	func updateView()
}

final class SenderViewController: UIViewController {
	
	let senderContentView: UIView & SenderContentViewProtocol
	let presenter: SenderPresenterProtocol
	
	init(
		senderContentView: UIView & SenderContentViewProtocol,
		presenter: SenderPresenterProtocol
	) {
		self.senderContentView = senderContentView
		self.presenter = presenter
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		self.view = senderContentView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		userEnteredSenderData()
	}
	
	func userEnteredSenderData() {
		senderContentView.completionHandler = { (surname, name, patronymic, phone) in
			self.presenter.userEnteredSenderData(surname, name, patronymic, phone)
		}
	}
}

extension SenderViewController: SenderViewControllerProtocol {
	func updateView() {
		
	}
}
