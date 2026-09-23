import UIKit
import SnapKit

protocol DeliveryMethodContentViewProtocol: AnyObject {
}

final class DeliveryMethodContentView: UIView, DeliveryMethodContentViewProtocol {
	
	
	private let shipmentTopView = ShipmentTopView(title: UIConstants.Shipment.HeaderNames.deliveryMethodTitle)
	private let scrollView = UIScrollView()
	private let contentView = UIView()
	private let mainStackView = UIStackView()
	private let promoBanner = PromoBanner()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configureUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configureUI() {
		backgroundColor = ContentColor.shipmentBackground
		
		setupHierarchy()
		setConstraints()
		configureScrollView()
		configureContent()
	}
}

private extension DeliveryMethodContentView {
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
	}
	
	func configureContent() {
		mainStackView.snp.makeConstraints {
			$0.top.bottom.equalToSuperview().inset(UIConstants.Inset.small)
			$0.leading.trailing.equalToSuperview().inset(UIConstants.Inset.small)
		}
		
		addProgressBarComponent()
		addDeliveryMethods()
		addAdvBannerLabel()
	}
}

private extension DeliveryMethodContentView {
	
	func addDeliveryMethods() {
		let expressDeliveryStack = makeDeliveryStack(imageName: "Plane",
													 typeDelivery: "Экспресс доставка до двери",
													 price: "780 ₽",
													 countDays: "1 рабочий день")
		
		let ussualyDeliveryStack = makeDeliveryStack(imageName: "Bus",
													 typeDelivery: "Обычная доставка",
													 price: "325 ₽",
													 countDays: "5 рабочих дней")
		
		[expressDeliveryStack,ussualyDeliveryStack].forEach {
			mainStackView.addArrangedSubview($0)
		}
	}
	
	func addProgressBarComponent() {
		let progressBarComponent = ProgressBarComponent()
		
		mainStackView.addArrangedSubview(progressBarComponent)
		progressBarComponent.makeComponent(currentStep: 1, totalSteps: 7)
	}
	
	func addAdvBannerLabel() {
		promoBanner.configure(
			backgroundColor: ContentColor.blueBackgroudColorForPromoAdv,
			titleFontSize: 32,
			titleText: "1+1=3",
			subtitleText: "3-я доставка в подарок!"
		)
		
		mainStackView.addArrangedSubview(promoBanner)
	}
}

private extension DeliveryMethodContentView {
	
	func makeDeliveryStack(imageName: String,
						   typeDelivery: String,
						   price: String,
						   countDays: String) -> UIStackView {
		
		let deliveryStack = UIStackView()
		
		deliveryStack.backgroundColor = .clear
		deliveryStack.axis = .horizontal
		deliveryStack.alignment = .top
		deliveryStack.layer.cornerRadius = UIConstants.Layer.CornerRadius.small
		deliveryStack.layer.borderWidth = 1
		deliveryStack.layer.borderColor = ContentColor.borderLight.cgColor
		deliveryStack.spacing = UIConstants.Spacing.medium
		deliveryStack.isLayoutMarginsRelativeArrangement = true
		deliveryStack.layoutMargins = .init(top: 16, left: 16, bottom: 16, right: 16)
		
		let attachedLeftStack = UIStackView()
		attachedLeftStack.axis = .vertical
		attachedLeftStack.spacing = UIConstants.Spacing.medium
		
		let deliveryInfoStack = makeDeliveryInfoStack(imageName: imageName,
													  typeDelivery: typeDelivery,
													  price: price)
		
		let deliveryTimeStack = makeDeliveryTimeStack(withDays: countDays)
		
		attachedLeftStack.addArrangedSubview(deliveryInfoStack)
		attachedLeftStack.addArrangedSubview(deliveryTimeStack)
		
		let buttonRight = UIButton()
		buttonRight.setImage(UIImage(named: "iconArrowRight"), for: .normal)
		buttonRight.snp.makeConstraints {
			$0.width.equalTo(24)
		}
		deliveryStack.addArrangedSubview(attachedLeftStack)
		deliveryStack.addArrangedSubview(buttonRight)
		
		return deliveryStack
	}
	
	func makeTypeAndPriceStack(typeDelivery: String, price: String) -> UIStackView {
		let stack = UIStackView()
		stack.axis = .vertical
		stack.spacing = UIConstants.Spacing.extraSmall
		
		let typeLabel = UILabel()
		typeLabel.text = typeDelivery
		typeLabel.font = .systemFont(ofSize: 12, weight: .regular)
		
		let priceLabel = UILabel()
		priceLabel.text = price
		priceLabel.font = .systemFont(ofSize: 24, weight: .semibold)
		
		stack.addArrangedSubview(typeLabel)
		stack.addArrangedSubview(priceLabel)
		
		return stack
	}
	
	func makeDeliveryInfoStack(imageName: String, typeDelivery: String, price: String) -> UIStackView {
		let stack = UIStackView()
		stack.axis = .horizontal
		stack.distribution = .fill
		stack.spacing = UIConstants.Spacing.medium
		
		let imageViewLeft = UIImageView()
		
		imageViewLeft.snp.makeConstraints {
			$0.height.width.equalTo(48)
		}
		
		imageViewLeft.backgroundColor = ContentColor.ellipseColor
		imageViewLeft.layer.cornerRadius = UIConstants.Layer.CornerRadius.medium
		imageViewLeft.clipsToBounds = true
		imageViewLeft.image = UIImage(named: imageName)
		imageViewLeft.contentMode = .center
		
		let stackTypeAndPrice = makeTypeAndPriceStack(typeDelivery: typeDelivery, price: price)
		
		stack.addArrangedSubview(imageViewLeft)
		stack.addArrangedSubview(stackTypeAndPrice)
		
		return stack
	}
	
	func makeDeliveryTimeStack(withDays: String) -> UIStackView {
		let stack = UIStackView()
		stack.axis = .horizontal
		stack.distribution = .fill
		stack.spacing = UIConstants.Spacing.medium
		
		let countDayLabel = UILabel()
		countDayLabel.text = withDays
		countDayLabel.font = .systemFont(ofSize: 12, weight: .regular)
		
		let labelLeft = UILabel()
		labelLeft.snp.makeConstraints {
			$0.width.equalTo(48)
		}
		
		let labelRight = UILabel()
		
		[
			labelLeft,
			countDayLabel,
			labelRight
		].forEach {
			stack.addArrangedSubview($0)
		}
		
		return stack
	}
}
