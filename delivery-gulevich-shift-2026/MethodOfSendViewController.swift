import UIKit
import SnapKit

class MethodOfSendViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Способ отправки"
		
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
