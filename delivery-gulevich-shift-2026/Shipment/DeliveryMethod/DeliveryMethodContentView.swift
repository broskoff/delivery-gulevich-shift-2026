import UIKit
import SnapKit

protocol DeliveryMethodViewDelegateProtocol: AnyObject {
	func didTapDeliveryToTheDoor()
}

protocol DeliveryMethodContentViewProtocol: AnyObject {
	var delegate: DeliveryMethodViewDelegateProtocol? { get set }
}

final class DeliveryMethodContentView: UIView, DeliveryMethodContentViewProtocol {
	
	weak var delegate: DeliveryMethodViewDelegateProtocol?
	
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
}

extension DeliveryMethodContentView {
	func configureUI() {
		backgroundColor = ContentColor.shipmentBackground
		
		setupHierarchy()
		
		setConstraintsShipmentTopView()
		
		configureScrollView()
		
		configureMainStackView()
	}
}

extension DeliveryMethodContentView {
	func setupHierarchy() {
		addSubview(shipmentTopView)
		addSubview(scrollView)
	}
	
	func setConstraintsShipmentTopView() {
		shipmentTopView.snp.makeConstraints {
			$0.top.equalToSuperview().offset(UIConstants.Offset.topScreen)
			$0.leading.trailing.equalToSuperview()
		}
	}
}

extension DeliveryMethodContentView {
	func configureScrollView() {
		scrollView.addSubview(contentView)
		contentView.addSubview(mainStackView)
		
		scrollView.bouncesHorizontally = false
		scrollView.alwaysBounceVertical = true
		
		scrollView.snp.makeConstraints {
			$0.top.equalTo(shipmentTopView.snp.bottom)
			$0.leading.trailing.equalToSuperview()
			$0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
		}
		
		configureContentView()
	}
	
	func configureContentView() {
		contentView.snp.makeConstraints {
			$0.edges.equalToSuperview()
			$0.width.equalToSuperview()
		}
	}
}

extension DeliveryMethodContentView {
	func configureMainStackView() {
		mainStackView.axis = .vertical
		mainStackView.spacing = UIConstants.Spacing.large
		
		mainStackView.snp.makeConstraints {
			$0.top.bottom.equalToSuperview().inset(UIConstants.Inset.small)
			$0.leading.trailing.equalToSuperview().inset(UIConstants.Inset.small)
		}
		
		configureProgressBarComponent()
		
		let expressDeliveryStack = DeliveryMethodStackFactory.setStacks(imageName: "Plane",
												   typeDelivery: "Экспресс доставка до двери",
												   price: "780 ₽",
												   countDays: "1 рабочий день")
		
		let ussualyDeliveryStack = DeliveryMethodStackFactory.setStacks(imageName: "Bus",
												 typeDelivery: "Обычная доставка",
												 price: "325 ₽",
												 countDays: "5 рабочих дней")
		[expressDeliveryStack,ussualyDeliveryStack].forEach {
			mainStackView.addArrangedSubview($0)
		}
		
		configureAdvBannerLabel()
	}
	
	func configureProgressBarComponent() {
		let progressBarComponent = ProgressBarComponent()
		
		mainStackView.addArrangedSubview(progressBarComponent)
		progressBarComponent.makeComponent(currentStep: 1, totalSteps: 7)
	}
	
	func configureAdvBannerLabel() {
		promoBanner.configure(
			backgroundColor: ContentColor.blueBackgroudColorForPromoAdv,
			titleFontSize: 32, 
			titleText: "1+1=3",
			subtitleText: "3-я доставка в подарок!"
		)
		mainStackView.addArrangedSubview(promoBanner)
	}
}
