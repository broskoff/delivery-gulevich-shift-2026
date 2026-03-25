import UIKit
protocol ICustomSelectedField: AnyObject {
	func didTapSelectedField()
}

enum SelectedFieldTagType: Int {
	case fromCity = 0
	case toCity = 1
	case sizePackage = 2
}

struct CustomSelectedFieldConfig {
	let tagType: SelectedFieldTagType
	let label: String
	let placeholder: String
	let leftIconName: String
}

final class CustomSelectedField: UIControl {
	
	weak var delegate: ICustomSelectedField?
	
	private let titleLabelField = UILabel()
	private let stackView = UIStackView()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func makeComponent(using config: CustomSelectedFieldConfig)  {
		layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
		
		titleLabelField.text = config.label
		titleLabelField.textColor = ContentColor.textSelectedFieldColor
		titleLabelField.font = UIFont.systemFont(ofSize: 14, weight: .medium)
		
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
			label.textColor = ContentColor.textSelectedFieldColor
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
		delegate?.didTapSelectedField()
	}
	
	func configureConstraints() {
		addSubview(titleLabelField)
		addSubview(stackView)
		
		titleLabelField.snp.makeConstraints {
			$0.top.equalTo(layoutMarginsGuide.snp.top)
			$0.leading.equalTo(layoutMarginsGuide.snp.leading)
			$0.trailing.equalTo(layoutMarginsGuide.snp.trailing)
		}
		
		stackView.snp.makeConstraints {
			$0.top.equalTo(titleLabelField.snp.bottom).offset(4)
			$0.bottom.equalTo(layoutMarginsGuide)
			$0.leading.equalTo(layoutMarginsGuide)
			$0.trailing.equalTo(layoutMarginsGuide)
			$0.height.equalTo(44)
		}
	}
}
