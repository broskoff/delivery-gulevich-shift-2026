import UIKit
import SnapKit

final class LeaveAtTheDoorControl: UIControl {
	
	var onInfoTap:(() -> Void)?
	var leaveAtTheDoor = false

	private let checkBoxButton = UIButton()
	private let infoButton = UIButton()
	private let titleLabel = UILabel()
	
	private let stackView = UIStackView()
	
	init() {
		super.init(frame: .zero)
		
		setHierarchy()
		
		configureCheckBoxButton()
		configureTitleLabel()
		configureInfoButton()
		
		setConstraintsStackView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setHierarchy() {
		[
			checkBoxButton,
			titleLabel,
			infoButton
		].forEach {
			stackView.addArrangedSubview($0)
		}
		
		stackView.axis = .horizontal
		stackView.spacing = 10
	
		addSubview(stackView)
	}
	
	private func setConstraintsStackView() {
		stackView.snp.makeConstraints {
			$0.top.leading.bottom.equalToSuperview()
		}
	}
	
	private func configureCheckBoxButton() {
		checkBoxButton.isSelected = false
		checkBoxButton.setImage(UIImage(systemName: "square"), for: .normal)
		checkBoxButton.setImage(UIImage(systemName: "checkmark.square"), for: .selected)

		checkBoxButton.tintColor = .systemGray4
		
		checkBoxButton.addTarget(self, action: #selector(changeCheckBox), for: .touchUpInside)
	}
	
	@objc
	func changeCheckBox() {
		checkBoxButton.isSelected.toggle()
		leaveAtTheDoor = checkBoxButton.isSelected
		sendActions(for: .valueChanged)
	}
	
	private func configureTitleLabel() {
		titleLabel.text = "Оставить заказ у двери"
	}
	
	private func configureInfoButton() {
		infoButton.setImage(UIImage(systemName: "questionmark.circle"), for: .normal)
		infoButton.tintColor = .systemGray4
		
		infoButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
	}
	
	@objc
	private func infoButtonTapped() {
		onInfoTap?()
	}
}
