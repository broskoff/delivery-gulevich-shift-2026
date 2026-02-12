import UIKit

class ProfileViewController: UIViewController, ICoordinating {
	
	var coordinator: ICoordinator?

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
