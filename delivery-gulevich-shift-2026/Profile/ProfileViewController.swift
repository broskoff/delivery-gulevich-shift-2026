import UIKit

class ProfileViewController: UIViewController {
	
	let profileView: ProfileView
	let profilePresenter: IProfilePresenter
	
	init(
		profileView: ProfileView,
		profilePresenter: IProfilePresenter
	) {
		self.profileView = profileView
		self.profilePresenter = profilePresenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		self.view = profileView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Профиль"
	}
}
