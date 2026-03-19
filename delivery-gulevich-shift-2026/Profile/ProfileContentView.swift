import UIKit
import SnapKit

protocol IProfileContentView: AnyObject {
	func configureUI()
}

final class ProfileContentView: UIView {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configureUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension ProfileContentView: IProfileContentView {
	
	func configureUI() {
		backgroundColor = ContentColor.calculateViewBackground
		
		configureLabel()
	}
	
	func configureLabel() {
		let label = UILabel()
		
		addSubview(label)
		
		label.text = "Раздел находится в стадии разработки"
		label.textColor = ContentColor.subTitleColor
		label.numberOfLines = 0
		
		label.snp.makeConstraints {
			$0.center.equalToSuperview()
		}
	}
}
