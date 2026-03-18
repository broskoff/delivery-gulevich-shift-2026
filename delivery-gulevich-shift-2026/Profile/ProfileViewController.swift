import UIKit

protocol IProfileView: AnyObject {
	func updateView()
}

class ProfileViewController: UIViewController {
	
	let profileContentView: IProfileContentView & UIView
	let profilePresenter: IProfilePresenter
	
	init(
		profileContentView: IProfileContentView & UIView,
		profilePresenter: IProfilePresenter
	) {
		self.profileContentView = profileContentView
		self.profilePresenter = profilePresenter
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
