import UIKit

protocol IProfileView: AnyObject {
	func updateView()
}

class ProfileViewController: UIViewController {
	
	let profileContentView: IProfileContentView & UIView
	let presenter: IProfilePresenter
	
	init(
		profileContentView: IProfileContentView & UIView,
		presenter: IProfilePresenter
	) {
		self.profileContentView = profileContentView
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		self.view = profileContentView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Профиль"
	}
}

extension ProfileViewController: IProfileView {
	func updateView() {
		
	}
}
