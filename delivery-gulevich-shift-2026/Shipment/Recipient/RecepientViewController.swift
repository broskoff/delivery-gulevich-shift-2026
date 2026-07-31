import UIKit

final class RecepientViewController: UIViewController {
	
	let recipientContentView = RecipientContentView()
//	let recipientContentView: UIView & RecipientContentViewProtocol
//	let presenter: RecepientPresenterProtocol
	
//	init(
//		recipientContentView: UIView & RecipientContentViewProtocol,
//		presenter: RecepientPresenterProtocol
//	) {
//		self.recipientContentView = recipientContentView
//		self.presenter = presenter
//		
//		super.init(nibName: nil, bundle: nil)
//	}
	
	override func loadView() {
		self.view = recipientContentView
		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
//	required init?(coder: NSCoder) {
//		fatalError("init(coder:) has not been implemented")
//	}
}
