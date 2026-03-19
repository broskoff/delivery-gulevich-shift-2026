import UIKit
import SnapKit

protocol IMethodOfSendViewDelegate: AnyObject {
	func didTapDeliveryToTheDoor()
}

protocol IMethodOfSendContentView: AnyObject {
	var delegate: IMethodOfSendViewDelegate? { get set }
}

final class MethodOfSendContentView: UIView, IMethodOfSendContentView {
	weak var delegate: IMethodOfSendViewDelegate?
	
	private let topView = UIView()
	
	private let scrollView = UIScrollView()
	private let contentView = UIView()
	private let mainStackView = UIStackView()
	private let titleStackView = UIStackView()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configureUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension MethodOfSendContentView {
	func configureUI() {
		backgroundColor = ContentColor.methodOfSendViewBackground
		
		setupHierarchy()
		
		configureTopView()
		
		configureScrollView()
		
		configureMainStackView()
	}
}

extension MethodOfSendContentView {
	func setupHierarchy() {
		addSubview(topView)
		addSubview(scrollView)
		
		topView.addSubview(titleStackView)
		
		scrollView.addSubview(contentView)
		contentView.addSubview(mainStackView)
	}
	
	func configureTopView() {
		topView.snp.makeConstraints {
			$0.top.equalToSuperview().offset(40)
			$0.leading.trailing.equalToSuperview()
		}
		
		configureTitleStackView()
		configureTitleLabel()
	}
	
	func configureTitleStackView() {
		titleStackView.axis = .vertical
		
		titleStackView.snp.makeConstraints {
			$0.edges.equalToSuperview().inset(20)
		}
	}
	
	func configureTitleLabel() {
		let titleLabel = UILabel()
		titleStackView.addArrangedSubview(titleLabel)
		
		titleLabel.text = "Способ отправки"
		titleLabel.textAlignment = .center
		titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
		
		titleLabel.snp.makeConstraints {
			$0.centerX.equalToSuperview()
		}
	}
}

extension MethodOfSendContentView {
	func configureScrollView() {
		scrollView.bouncesHorizontally = false
		scrollView.alwaysBounceVertical = true
		
		scrollView.snp.makeConstraints {
			$0.top.equalTo(topView.snp.bottom).offset(16)
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

extension MethodOfSendContentView {
	func configureMainStackView() {
		mainStackView.axis = .vertical
		mainStackView.spacing = 32
		
		mainStackView.snp.makeConstraints {
			$0.top.bottom.equalToSuperview().inset(16)
			$0.leading.trailing.equalToSuperview().inset(16)
		}
		
		configureProgressBarComponent()
		
		let expressDeliveryStack = DeliveryMethodStackFactory.setStacks(imageName: "Plane",
												   typeDelivery: "Экспресс доставка до двери",
												   price: "780 Р",
												   countDays: "1 рабочий день")
		
		let ussualyDeliveryStack = DeliveryMethodStackFactory.setStacks(imageName: "Bus",
												 typeDelivery: "Обычная доставка",
												 price: "325 Р",
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
		
		let advBanner = AdvBannerFactory.createAdvBannerStackView(
			backgroundColor: ContentColor.blueBackgroudColorForPromoAdv,
			titleFontSize: 32, 
			titleText: "1+1=3",
			subtitleText: "3-я доставка в подарок!"
		)
		
		mainStackView.addArrangedSubview(advBanner)
	}
}
