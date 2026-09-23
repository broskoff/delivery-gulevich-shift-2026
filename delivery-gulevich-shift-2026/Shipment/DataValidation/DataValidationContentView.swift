
import UIKit
import SnapKit

protocol DataValidationContentViewProtocol: AnyObject {
//	var completionHandler: (() -> Void)? { get set }
}

final class DataValidationContentView: UIView, DataValidationContentViewProtocol {
//	var completionHandler: (() -> Void)?
	
	private let shipmentTopView = ShipmentTopView(title: UIConstants.Shipment.HeaderNames.dataValidationTitle)
	private let scrollView = UIScrollView()
	private let contentView = UIView()
	private let mainStackView = UIStackView()
	private let arrangeButton = BigBlueButtonFactory.make(withTitle: "Оформить")
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configureUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

private extension DataValidationContentView {
	
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
		progressBarComponent.makeComponent(currentStep: 7, totalSteps: 7)
	}
	
	func configureTextField() {
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
			
			mainStackView.addArrangedSubview(textField)
		}
	
	func addContinueButton() {
		arrangeButton.snp.makeConstraints {
			$0.height.equalTo(UIConstants.Calculation.Heights.button)
		}
		
		mainStackView.addArrangedSubview(arrangeButton)
		
		arrangeButton.addAction(UIAction { _ in
			
//			self?.completionHandler?()
			
		}, for: .touchUpInside)
	}
}
