import UIKit

protocol SenderAddressContentViewProtocol: AnyObject  {
	var completionHandler: ((String, String, String, String) -> Void)? { get set }
}

final class SenderAddressContentView: UIView, SenderAddressContentViewProtocol {
	var completionHandler: ((String, String, String, String) -> Void)?
	var textFields: [UITextField] = []
	
	private let shipmentTopView = ShipmentTopView(title: UIConstants.Shipment.HeaderNames.senderAddressTitle)
	private let scrollView = UIScrollView()
	private let contentView = UIView()
	private let mainStackView = UIStackView()
	private let continueButton = BigBlueButtonFactory.make(withTitle: "Продолжить")
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configureUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

private extension SenderAddressContentView {
	
	func configureUI() {
		backgroundColor = ContentColor.shipmentBackground
		
		setupHierarchy()
		setConstraints()
		configureScrollView()
	}
	
	func setupHierarchy() {
		addSubview(shipmentTopView)
		addSubview(scrollView)
	}
	
	func setConstraints() {
		shipmentTopView.snp.makeConstraints {
			$0.top.equalToSuperview().offset(UIConstants.Offset.topScreen)
			$0.leading.trailing.equalToSuperview()
		}
		
		scrollView.snp.makeConstraints {
			$0.top.equalTo(shipmentTopView.snp.bottom)
			$0.leading.trailing.equalToSuperview()
			$0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
		}
	}
	
	func configureScrollView() {
		scrollView.addSubview(contentView)
		contentView.addSubview(mainStackView)
		
		scrollView.bouncesHorizontally = false
		scrollView.alwaysBounceVertical = true
		
		configureContentView()
		configureMainStackView()
		configureProgressBarComponent()
		configureTextField()
		addContinueButton()
	}
	
	func configureContentView() {
		contentView.snp.makeConstraints {
			$0.edges.equalToSuperview()
			$0.width.equalToSuperview()
		}
	}
	
	func configureMainStackView() {
		mainStackView.axis = .vertical
		mainStackView.spacing = UIConstants.Spacing.large
		
		mainStackView.snp.makeConstraints {
			$0.top.bottom.equalToSuperview().inset(UIConstants.Inset.small)
			$0.leading.trailing.equalToSuperview().inset(UIConstants.Inset.small)
		}
	}
	
	func configureProgressBarComponent() {
		let progressBarComponent = ProgressBarComponent()
		
		mainStackView.addArrangedSubview(progressBarComponent)
		progressBarComponent.makeComponent(currentStep: 4, totalSteps: 7)
	}
	
	func configureTextField() {
		for _ in 1...4 {
			let textField = UITextField()
			
			textField.layer.cornerRadius = UIConstants.Layer.CornerRadius.extraSmall
			textField.layer.borderWidth = 1
			textField.layer.borderColor = ContentColor.borderLight.cgColor
			
			textField.leftView = UIView(frame: CGRect(x: 0,
													  y: 0,
													  width: 8,
													  height: textField.frame.height))
			textField.leftViewMode = .always
			
			textField.snp.makeConstraints {
				$0.height.equalTo(48)
			}
			
			textFields.append(textField)
			
			mainStackView.addArrangedSubview(textField)
		}
		
		textFields[0].placeholder = "Улица"
		textFields[1].placeholder = "Дом"
		textFields[2].placeholder = "Квартира"
		textFields[3].placeholder = "Заметка для курьера"
	}
	
	func addContinueButton() {
		continueButton.snp.makeConstraints {
			$0.height.equalTo(UIConstants.Calculation.Heights.button)
		}
		
		mainStackView.addArrangedSubview(continueButton)
		
		continueButton.addAction(UIAction { [weak self] _ in
			guard
				let street = self?.textFields[0].text,
				let house = self?.textFields[1].text,
				let apartment = self?.textFields[2].text,
				let note = self?.textFields[3].text else { fatalError() }
			
			self?.completionHandler?(street, house, apartment, note)
		}, for: .touchUpInside)
	}
}
