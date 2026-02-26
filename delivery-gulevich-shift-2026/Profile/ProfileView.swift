import UIKit
import SnapKit

final class ProfileView: UIView {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configureUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension ProfileView {
	
	func configureUI() {
		backgroundColor = ContentColor.viewBackground
		
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
