import UIKit

protocol IProfileView: AnyObject {
	func updateView()
}

class ProfileViewController: UIViewController, ProfileContentViewDelegateProtocol {
	
	let profileContentView: ProfileContentViewProtocol & UIView
	let profilePresenter: IProfilePresenter
	
	init(
		profileContentView: ProfileContentViewProtocol & UIView,
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
		
		profileContentView.delegate = self
		
		title = "Профиль"
	}
	
	func didChoiceSegment(index: Int) {
		profilePresenter.userChoiceSegment(index: index)
	}
}

extension ProfileViewController: IProfileView {
	func updateView() {
//		profileContentView
	}
}
