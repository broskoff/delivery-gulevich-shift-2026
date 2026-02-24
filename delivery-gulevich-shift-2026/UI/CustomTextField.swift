import UIKit
import SnapKit

enum TextFieldTagType: Int {
	case fromCity = 0
	case toCity = 1
	case sizePackage = 2
}

struct CustomTextFieldConfig {
	let tagType: TextFieldTagType
	let label: String
	let placeholder: String
	let borderColor: UIColor
}

final class CustomTextField: UIView {
	
	private let label = UILabel(frame: .zero)
	private let textField = UITextField(frame: .zero)
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func makeComponent(delegate: UITextFieldDelegate,
					   config: CustomTextFieldConfig) {
		layoutMargins = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
		configureConstraints()
		
		label.text = config.label
		
		textField.delegate = delegate
		//возможно не пригодится, когда разберусь в Dropmenu/Это отдельный экран
		textField.placeholder = config.placeholder
		textField.tag = config.tagType.rawValue
		textField.layer.cornerRadius = 8
		textField.layer.borderWidth = 1
		textField.layer.borderColor = config.borderColor.cgColor
		//вместо этой UIView скорее всего будет картинка геоточки
		textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: textField.frame.height))
		textField.leftViewMode = .always
	}
	
	func configureConstraints() {
		addSubview(label)
		addSubview(textField)
		
		label.snp.makeConstraints {
			$0.top.equalTo(layoutMarginsGuide.snp.top)
			$0.leading.equalTo(layoutMarginsGuide.snp.leading)
			$0.trailing.equalTo(layoutMarginsGuide.snp.trailing)
		}
		
		textField.snp.makeConstraints {
			$0.top.equalTo(label.snp.bottom).offset(4)
			$0.bottom.equalTo(layoutMarginsGuide)
			$0.leading.equalTo(layoutMarginsGuide)
			$0.trailing.equalTo(layoutMarginsGuide)
			$0.height.equalTo(40)
		}
	}
}
