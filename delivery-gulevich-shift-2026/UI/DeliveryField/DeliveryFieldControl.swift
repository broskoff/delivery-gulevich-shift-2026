import UIKit

final class DeliveryFieldControl: UIControl {
	
	var onTap: (() -> ())?
	
	private let contentView = UIView()
	private let stackView = UIStackView()
	private let titleLabel = UILabel()
	private let leftIcon = UIImageView()
	private let rightIcon = UIImageView()
	
	var selectedValue: String {
		didSet {
			titleLabel.text = selectedValue
		}
	}
	
	init(imageName: String, selectedValue: String) {
		self.selectedValue = selectedValue
		super.init(frame: .zero)
		titleLabel.text = selectedValue
		
		setupHierarchy()
		configureIcons(imageName)
		setupUI()
		setupConstraints()
		
		addTarget(self, action: #selector(didTap), for: .touchUpInside)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@objc
	private func didTap() {
		print("didTap")
		onTap?()
	}
}

private extension DeliveryFieldControl {
	
	func setupHierarchy() {
		addSubview(contentView)
		contentView.addSubview(stackView)
	}
	
	func setupUI() {
		
		let spacerView: UIView = {
			let spacer = UIView()
			spacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
			spacer.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
			return spacer
		}()
		
		contentView.layer.cornerRadius = 8
		contentView.layer.borderWidth = 1
		contentView.layer.borderColor = ContentColor.borderLight.cgColor
		contentView.layoutMargins = UIEdgeInsets(
			top: 8,
			left: 16,
			bottom: 8,
			right: 8
		)
		contentView.isUserInteractionEnabled = false
		
		stackView.axis = .horizontal
		stackView.spacing = 8
		stackView.isUserInteractionEnabled = false
		
		[
			leftIcon,
			titleLabel,
			spacerView,
			rightIcon
		].forEach {
			stackView.addArrangedSubview($0)
		}
	}
	
	func configureIcons(_ imageName: String) {
		leftIcon.image = UIImage(named: imageName)
		leftIcon.contentMode = .scaleAspectFit
		
		rightIcon.image = UIImage(named: "ChevronDown")
		rightIcon.contentMode = .scaleAspectFit
	}
	
	func setupConstraints() {
		contentView.snp.makeConstraints {
			$0.edges.equalToSuperview()
			$0.height.equalTo(44)
		}
		
		stackView.snp.makeConstraints {
			$0.edges.equalTo(contentView.layoutMarginsGuide)
		}
	}
}

