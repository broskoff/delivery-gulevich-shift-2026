import UIKit
import SnapKit

final class ShipmentTopView: UIView {

	let stackView = UIStackView()
	let label = UILabel()
	
	init(title: String) {
		super.init(frame: .zero)
		
		setHierarchy()
		setConfigureStackView()
		setConfigureLabel(title)
		setConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

private extension ShipmentTopView {
	
	func setHierarchy() {
		addSubview(stackView)
		stackView.addArrangedSubview(label)
	}
	
	func setConfigureStackView() {
		stackView.axis = .vertical
	}
	
	func setConfigureLabel(_ title: String) {
		label.text = title
		label.textAlignment = .center
		label.font = .systemFont(ofSize: 28, weight: .bold)
	}
	
	func setConstraints() {
		stackView.snp.makeConstraints {
			$0.edges.equalToSuperview().inset(20)
		}
		
		label.snp.makeConstraints {
			$0.centerX.equalToSuperview()
		}
	}
}
