import UIKit
import SnapKit

protocol IHistoryContentView: AnyObject {
	func configUI()
}

final class HistoryContentView: UIView {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension HistoryContentView: IHistoryContentView {
	
	func configUI() {
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
