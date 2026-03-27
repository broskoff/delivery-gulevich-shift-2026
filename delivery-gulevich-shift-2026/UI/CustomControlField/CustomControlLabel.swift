import UIKit

final class CustomControlLabel: UIView {
	
	var label = UILabel()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func create(withText text: String) {

		label.text = text
		label.textColor = ContentColor.text
		label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
		
		addSubview(label)
		
		label.snp.makeConstraints {
			$0.top.leading.trailing.equalToSuperview()
			$0.bottom.equalToSuperview().offset(16)
		}
	}
}
