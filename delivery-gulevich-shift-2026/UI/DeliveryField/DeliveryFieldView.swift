import UIKit

final class DeliveryFieldView: UIView {
	
	private let stackView = UIStackView()
	private let fieldTitle = UILabel()
	private let customControl: DeliveryFieldControl
	
	init(title: String, control: DeliveryFieldControl) {
		self.customControl = control
		
		super.init(frame: .zero)
		
		fieldTitle.text = title
		
		setupHierarchy()
		setupUI()
		setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

private extension DeliveryFieldView {
	
	func setupHierarchy() {
		addSubview(stackView)
	}
	
	func setupUI() {
		backgroundColor = .white
		
		stackView.axis = .vertical
		stackView.spacing = UIConstants.Spacing.extraSmall
		
		[
			fieldTitle,
			customControl
		].forEach {
			stackView.addArrangedSubview($0)
		}
	}
	
	func setupConstraints() {
		stackView.snp.makeConstraints {
			$0.edges.equalToSuperview()
		}
	}
}
