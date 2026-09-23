
import UIKit
import SnapKit

protocol PaymentDeliveryContentViewProtocol: AnyObject {
//	var completionHandler: (() -> Void)? { get set }
}

final class PaymentDeliveryContentView: UIView, PaymentDeliveryContentViewProtocol {
//	var completionHandler: (() -> Void)?
	
	private let shipmentTopView = ShipmentTopView(title: UIConstants.Shipment.HeaderNames.paymentDeliveryTitle)
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

private extension PaymentDeliveryContentView {
	
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
		progressBarComponent.makeComponent(currentStep: 6, totalSteps: 7)
	}
	
	func addContinueButton() {
		continueButton.snp.makeConstraints {
			$0.height.equalTo(UIConstants.Calculation.Heights.button)
		}
		
		mainStackView.addArrangedSubview(continueButton)
		
		continueButton.addAction(UIAction { _ in
			
//			self?.completionHandler?()
			
		}, for: .touchUpInside)
	}
}
