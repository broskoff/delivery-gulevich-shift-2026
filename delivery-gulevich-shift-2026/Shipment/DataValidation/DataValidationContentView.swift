import UIKit
import SnapKit

protocol DataValidationContentViewProtocol: AnyObject {
	var onTap: (() -> Void)? { get set }
	
	func showData(_ data: DataToDelivery)
}

final class DataValidationContentView: UIView, DataValidationContentViewProtocol {
	var onTap: (() -> Void)?
	
	private let shipmentTopView = ShipmentTopView(title: UIConstants.Shipment.HeaderNames.dataValidationTitle)
	private let scrollView = UIScrollView()
	private let contentView = UIView()
	private let mainStackView = UIStackView()
	private let progressBarComponent = ProgressBarComponent(currentStep: 7, totalSteps: 7)
	private let recipientCard = DataValidationCard()
	private let senderCard = DataValidationCard()
	private let senderAddressCard = DataValidationCard()
	private let recipientAddressCard = DataValidationCard()
	private let checkoutButton = BigBlueButtonFactory.make(withTitle: UIConstants.BigBlueButton.checkout)
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configureUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func showData(_ data: DataToDelivery) {
		guard
			let type = data.type,
			let price = data.price,
			let payer = data.payer else { fatalError() }
		
	}
}

private extension DataValidationContentView {
	
	func configureUI() {
		backgroundColor = ContentColor.shipmentBackground
		
		setupHierarchy()
		configureScrollView()
		configureMainStackView()
		setupCheckoutButtonAction()
		setupConstraints()
	}
	
	func setupHierarchy() {
		addSubview(shipmentTopView)
		addSubview(scrollView)
		
		scrollView.addSubview(contentView)
		
		contentView.addSubview(mainStackView)
		
		mainStackView.addArrangedSubview(progressBarComponent)
		mainStackView.addArrangedSubview(recipientCard)
		mainStackView.addArrangedSubview(senderCard)
		mainStackView.addArrangedSubview(senderAddressCard)
		mainStackView.addArrangedSubview(recipientAddressCard)
		mainStackView.addArrangedSubview(checkoutButton)
	}
	
	func configureScrollView() {
		scrollView.bouncesHorizontally = false
		scrollView.alwaysBounceVertical = true
	}
	
	func configureMainStackView() {
		mainStackView.axis = .vertical
		mainStackView.spacing = UIConstants.Spacing.large
	}
	
	func setupCheckoutButtonAction() {
		checkoutButton.addAction(UIAction { _ in
			self.onTap?()
		}, for: .touchUpInside)
	}
	
	func setupConstraints() {
		shipmentTopView.snp.makeConstraints {
			$0.top.equalToSuperview().offset(UIConstants.Offset.topScreen)
			$0.leading.trailing.equalToSuperview()
		}
		
		scrollView.snp.makeConstraints {
			$0.top.equalTo(shipmentTopView.snp.bottom)
			$0.leading.trailing.equalToSuperview()
			$0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
		}
		
		contentView.snp.makeConstraints {
			$0.edges.equalTo(scrollView.contentLayoutGuide)
			$0.width.equalTo(scrollView.frameLayoutGuide)
		}
		
		mainStackView.snp.makeConstraints {
			$0.top.bottom.equalToSuperview().inset(UIConstants.Inset.small)
			$0.leading.trailing.equalToSuperview().inset(UIConstants.Inset.small)
		}
		
		checkoutButton.snp.makeConstraints {
			$0.height.equalTo(UIConstants.BigBlueButton.heightButton)
		}
	}
}
