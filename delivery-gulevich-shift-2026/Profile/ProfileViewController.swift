import UIKit

class ProfileViewController: UIViewController {
	
	var coordinator: IMainCoordinator
	
	init(
		coordinator: IMainCoordinator
	) {
		self.coordinator = coordinator
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Профиль"
		
		view.backgroundColor = ContentColor.viewBackground
		
		configureLabel()
	}
	
	func configureLabel() {
		let label = UILabel()
		
		view.addSubview(label)
		
		label.text = "Раздел находится в стадии разработки"
		label.textColor = ContentColor.subTitleColor
		label.numberOfLines = 0
		
		label.snp.makeConstraints {
			$0.center.equalToSuperview()
		}
	}
}
