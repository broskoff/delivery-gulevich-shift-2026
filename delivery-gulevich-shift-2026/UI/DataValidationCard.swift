import UIKit
import SnapKit

struct DataValidationCardModel {
	let nameCard: String
	
	let firstFieldTitle: String
	let firstFieldValue: String
	
	let secondFieldTitle: String
	let secondFieldValue: String
}

final class DataValidationCard: UIView {
	private let nameLabel = UILabel()
	private let firstFieldTitleLabel = UILabel()
	private let firstFieldValueLabel = UILabel()
	private let secondFieldTitleLabel = UILabel()
	private let secondFieldValueLabel = UILabel()
	private let image = UIImageView()
	private let nameStack = UIStackView()
	private let dataStackOne = UIStackView()
	private let dataStackTwo = UIStackView()
	private let mainDataStack = UIStackView()
	private let mainStack = UIStackView()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configureUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure(with model: DataValidationCardModel) {
		nameLabel.text = model.nameCard
		firstFieldTitleLabel.text = model.firstFieldTitle
		firstFieldValueLabel.text = model.firstFieldValue
		secondFieldTitleLabel.text = model.secondFieldTitle
		secondFieldValueLabel.text = model.secondFieldValue
	}
}

private extension DataValidationCard {
	
	func configureUI() {
		setupHierarchy()
		setupImage()
		configureNameStack()
		setupSecondaryTextOneLabel()
		setupSecondaryTextTwoLabel()
		setupTextOneLabel()
		setupTextTwoLabel()
		configurDataStackOne()
		configurDataStackTwo()
		configurMainDataStack()
		configureMainStack()
		setupConstraints()
	}
	
	func setupHierarchy() {
		addSubview(mainStack)
		
		nameStack.addArrangedSubview(nameLabel)
		nameStack.addArrangedSubview(image)
		
		dataStackOne.addArrangedSubview(firstFieldTitleLabel)
		dataStackOne.addArrangedSubview(firstFieldValueLabel)
		
		dataStackTwo.addArrangedSubview(secondFieldTitleLabel)
		dataStackTwo.addArrangedSubview(secondFieldValueLabel)
		
		mainDataStack.addArrangedSubview(dataStackOne)
		mainDataStack.addArrangedSubview(dataStackTwo)
		
		mainStack.addArrangedSubview(nameStack)
		mainStack.addArrangedSubview(mainDataStack)
	}
	
	func setupImage() {
		image.image = UIImage(named: "Edit")
		image.contentMode = .scaleAspectFit
		
		image.setContentHuggingPriority(.required, for: .horizontal)
	}
	
	func configureNameStack() {
		nameStack.axis = .horizontal
		nameStack.spacing = UIConstants.Spacing.small
	}
	
	func setupSecondaryTextOneLabel() {
		firstFieldTitleLabel.font = .systemFont(ofSize: 12, weight: .regular)
		firstFieldTitleLabel.textColor = .systemGray
	}
	
	func setupTextOneLabel() {
		firstFieldValueLabel.font = .systemFont(ofSize: 16, weight: .regular)
	}
	
	func setupSecondaryTextTwoLabel() {
		secondFieldTitleLabel.font = .systemFont(ofSize: 12, weight: .regular)
		secondFieldTitleLabel.textColor = .systemGray
	}
	
	func setupTextTwoLabel() {
		secondFieldValueLabel.font = .systemFont(ofSize: 16, weight: .regular)
	}
	
	func configurDataStackOne() {
		dataStackOne.axis = .vertical
		dataStackOne.spacing = 0
	}
	
	func configurDataStackTwo() {
		dataStackTwo.axis = .vertical
		dataStackTwo.spacing = 0
	}
	
	func configurMainDataStack() {
		mainDataStack.axis = .vertical
		mainDataStack.spacing = UIConstants.Spacing.small
	}
	
	func configureMainStack() {
		mainStack.backgroundColor = .secondarySystemBackground
		mainStack.axis = .vertical
		mainStack.spacing = UIConstants.Spacing.small
		mainStack.layer.cornerRadius = UIConstants.Layer.CornerRadius.small
		
		mainStack.isLayoutMarginsRelativeArrangement = true
		mainStack.layoutMargins = UIEdgeInsets(
			top: 16,
			left: 16,
			bottom: 16,
			right: 16)
	}
	
	func setupConstraints() {
		mainStack.snp.makeConstraints {
			$0.edges.equalToSuperview()
		}
	}
}
