import UIKit
protocol ICustomControlField: AnyObject {
	func didTapCitySelectedField()
	func didTapPackageSizeField()
}

enum CustomControlFieldType: Int {
	case city = 0
	case sizePackage = 1
}

struct CustomControlFieldConfig {
	let tagType: CustomControlFieldType
	let placeholder: String
	let leftIconName: String
}

final class CustomControlField: UIControl {
	
	weak var delegate: ICustomControlField?
	
	private let stackView = UIStackView()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func makeComponent(using config: CustomControlFieldConfig)  {
		layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
		
		let spacerView: UIView = {
			let spacer = UIView()
			spacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
			spacer.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
			return spacer
		}()
		
		let leftImageView: UIImageView = {
			let image = UIImage(named: config.leftIconName)
			let imageView = UIImageView(image: image)
			imageView.contentMode = .scaleAspectFit
			return imageView
		}()
		
		let rightImageView: UIImageView = {
			let image = UIImage(named: "ChevronDown")
			let imageView = UIImageView(image: image)
			imageView.contentMode = .scaleAspectFit
			return imageView
		}()
		
		let placeholderLabel: UILabel = {
			let label = UILabel()
			label.text = config.placeholder
			label.textColor = ContentColor.text
			return label
		}()
		
		stackView.axis = .horizontal
		stackView.spacing = 8
		stackView.layer.cornerRadius = 8
		stackView.layer.borderWidth = 1
		stackView.layer.borderColor = ContentColor.borderLight.cgColor
		stackView.layoutMargins = UIEdgeInsets(
			top: 8,
			left: 16,
			bottom: 8,
			right: 8
		)
		stackView.isLayoutMarginsRelativeArrangement = true
		stackView.isUserInteractionEnabled = false
		stackView.tag = config.tagType.rawValue
		
		[
			leftImageView,
			placeholderLabel,
			spacerView,
			rightImageView
		].forEach {
			stackView.addArrangedSubview($0)
		}
		
		configureConstraints()
		
		addTarget(self, action: #selector(didTap), for: .touchUpInside)
	}
	
	@objc
	func didTap() {
		
		switch stackView.tag {
		case 0:
			delegate?.didTapCitySelectedField()
		case 1:
			delegate?.didTapPackageSizeField()
		default:
			break
		}
	}
	
	func configureConstraints() {
		addSubview(stackView)
		
		stackView.snp.makeConstraints {
			$0.top.equalTo(layoutMarginsGuide)
			$0.bottom.equalTo(layoutMarginsGuide)
			$0.leading.equalTo(layoutMarginsGuide)
			$0.trailing.equalTo(layoutMarginsGuide)
			$0.height.equalTo(44)
		}
	}
}
