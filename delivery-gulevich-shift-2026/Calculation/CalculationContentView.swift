import UIKit
import SnapKit

protocol ICalculationContentViewDelegate: AnyObject {
	func didTapCalculateDelivery()
	func didTapTrackParcel()
	
	func didTapDepartureCityField()
	func didTapDestinationCityField()
	func didTapPackageSizeField()
}

protocol ICalculationContentView : AnyObject {
	var delegate: ICalculationContentViewDelegate? { get set }
	
	func updateDepartureCity(_ city: String)
}

final class CalculationContentView: UIView, ICalculationContentView {
	
	weak var delegate: ICalculationContentViewDelegate?
	
	private let topView = UIView()
	private let scrollView = UIScrollView()
	private let contentView = UIView()
	private let mainStackView = UIStackView()
	
	private let headerStackView = UIStackView()
	private let deliveryCalculationStackView = UIStackView()
	private let trackStackView = UIStackView()
	private let promoBanner = PromoBanner()
	
	private let departureCityControl = DeliveryFieldControl(
		imageName: "IconLocation",
		selectedValue: "Выберите город"
	)
	private let destinationCityControl = DeliveryFieldControl(
		imageName: "pointer",
		selectedValue: "Выберите город"
	)
	private let sizePackageControl = DeliveryFieldControl(
		imageName: "IconEnvelope",
		selectedValue: "Конверт"
	)
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configureUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func updateDepartureCity(_ city: String) {
//		MARK: Заполнить схему обновления поля Departure
	}
}

private extension CalculationContentView {
	
	func configureUI() {
		
		backgroundColor = ContentColor.calculateViewBackground
		
		setupHierarchy()
		configureHeader()
		configureScrollView()
		configureMainStackView()
		
		configureDeliveryСalculationStackView()
		configureLabelCalculateDelivery()
		configureShipmentFields()
		configureButtonCalcDelivery()
		
		configureTrackStackView()
		configureTrackLabel()
		configureTrackTextField()
		configureButtonTrack()
		
		configurePromoBanner()
	}
	
	func setupHierarchy() {
		addSubview(topView)
		addSubview(scrollView)
		
		topView.addSubview(headerStackView)
		
		scrollView.addSubview(contentView)
		contentView.addSubview(mainStackView)
		
		mainStackView.addArrangedSubview(deliveryCalculationStackView)
		mainStackView.addArrangedSubview(trackStackView)
		mainStackView.addArrangedSubview(promoBanner)
	}
}

private extension CalculationContentView {
	func configureHeader() {
		setupConstraintsTopView()
		configureTitleStackView()
		configureTitleLabels()
	}
	
	func setupConstraintsTopView() {
		topView.snp.makeConstraints {
			$0.top.equalToSuperview().offset(64)
			$0.leading.trailing.equalToSuperview()
			$0.height.equalTo(140)
		}
	}
	
	func configureTitleStackView() {
		headerStackView.axis = .vertical
		headerStackView.spacing = UIConstants.Spacing.extraSmall
		
		headerStackView.snp.makeConstraints {
			$0.top.equalToSuperview()
			$0.leading.trailing.equalToSuperview().inset(UIConstants.Inset.small)
		}
	}
	
	func configureTitleLabels() {
		let titleLabel = UILabel()
		let subtitleLabel = UILabel()
		
		headerStackView.addArrangedSubview(titleLabel)
		headerStackView.addArrangedSubview(subtitleLabel)
		
		titleLabel.text = UIConstants.Calculation.HeaderNames.title
		titleLabel.numberOfLines = 0
		titleLabel.textAlignment = .left
		titleLabel.font = .systemFont(ofSize: 30, weight: .bold)
		
		subtitleLabel.text = UIConstants.Calculation.HeaderNames.subtitle
		subtitleLabel.numberOfLines = 2
		subtitleLabel.textColor = ContentColor.subTitleColor
	}
}

private extension CalculationContentView {
	func configureScrollView() {
		scrollView.bouncesHorizontally = false
		scrollView.alwaysBounceVertical = true
		
		setupConstraintsScrollView()
		setupConstraintsContentView()
	}
	
	func setupConstraintsScrollView() {
		scrollView.snp.makeConstraints {
			$0.top.equalTo(topView.snp.bottom)
			$0.leading.trailing.equalToSuperview()
			$0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
		}
	}
	
	func setupConstraintsContentView() {
		contentView.snp.makeConstraints {
			$0.edges.equalToSuperview()
			$0.width.equalToSuperview()
		}
	}
	
	func configureMainStackView() {
		mainStackView.axis = .vertical
		mainStackView.spacing = UIConstants.Spacing.medium
		
		setupConstraintsMainStackView()
	}
	
	func setupConstraintsMainStackView() {
		mainStackView.snp.makeConstraints {
			$0.top.leading.trailing.equalToSuperview().inset(UIConstants.Inset.small)
			$0.bottom.equalToSuperview().inset(UIConstants.Inset.small)
		}
	}
}
	
private extension CalculationContentView {
	func configureDeliveryСalculationStackView() {
		deliveryCalculationStackView.backgroundColor = .white
		deliveryCalculationStackView.axis = .vertical
		deliveryCalculationStackView.spacing = UIConstants.Spacing.medium
		
		deliveryCalculationStackView.layer.cornerRadius = UIConstants.Layer.CornerRadius.medium
		
		deliveryCalculationStackView.isLayoutMarginsRelativeArrangement = true
		deliveryCalculationStackView.layoutMargins = .init(top: 32, left: 16, bottom: 32, right: 16)
	}
	
	func configureLabelCalculateDelivery() {
		let label = UILabel()
		label.text = UIConstants.Calculation.CardNames.calculate
		label.textAlignment = .center
		label.font = .systemFont(ofSize: 30, weight: .bold)
		
		deliveryCalculationStackView.addArrangedSubview(label)
	}
}

private extension CalculationContentView {
	func configureShipmentFields() {
		
		departureCityControl.onTap = { [weak self] in
			self?.delegate?.didTapDepartureCityField()
		}
		let departureCityField = DeliveryFieldView(title: "Город отправки", control: departureCityControl)
		
		destinationCityControl.onTap = { [weak self] in
			self?.delegate?.didTapDestinationCityField()
		}
		let destinationCityField = DeliveryFieldView(title: "Город назначения", control: destinationCityControl)
		
		sizePackageControl.onTap = { [weak self] in
			self?.delegate?.didTapPackageSizeField()
		}
		let sizePackageField = DeliveryFieldView(title: "Размер посылки", control: sizePackageControl)
		
		let stackView = UIStackView()
		stackView.backgroundColor = .white
		stackView.axis = .vertical
		stackView.spacing = UIConstants.Spacing.medium
		
		[
			departureCityField,
			destinationCityField,
			sizePackageField
		].forEach {
			stackView.addArrangedSubview($0)
		}
		
		deliveryCalculationStackView.addArrangedSubview(stackView)
	}
}

private extension CalculationContentView {
	
	func configureTrackStackView() {
		trackStackView.backgroundColor = .white
		trackStackView.axis = .vertical
		trackStackView.spacing = UIConstants.Spacing.large
		
		trackStackView.layer.cornerRadius = UIConstants.Layer.CornerRadius.small
		
		trackStackView.isLayoutMarginsRelativeArrangement = true
		trackStackView.layoutMargins = .init(top: 32, left: 16, bottom: 32, right: 16)
	}
	
	func configureTrackLabel() {
		let label = UILabel()
		label.text = UIConstants.Calculation.CardNames.track
		label.textAlignment = .center
		label.font = .systemFont(ofSize: 30, weight: .bold)
		
		trackStackView.addArrangedSubview(label)
	}
	
	func configureTrackTextField() {
		let textField = UITextField()
		
		textField.placeholder = UIConstants.Calculation.Placeholder.orderNumber
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
		
		trackStackView.addArrangedSubview(textField)
	}
	
	//MARK: Действие кнопки "Найти"
	func configureButtonTrack() {
		let button = CustomButtonFactory.make(withTitle: UIConstants.Calculation.ButtonNames.find)
		
		button.snp.makeConstraints {
			$0.height.equalTo(UIConstants.Calculation.Heights.button)
		}
		
		trackStackView.addArrangedSubview(button)
		
		button.addTarget(self, action: #selector(buttonTrackTapped), for: .touchUpInside)
	}
	
	@objc
	func buttonTrackTapped() {
		delegate?.didTapTrackParcel()
		print("нажали кнопку Найти. Это напечатано из CalculationContentView 3")
	}
}

private extension CalculationContentView {

	func configurePromoBanner() {
		promoBanner.configure(
			backgroundColor: ContentColor.brownBackgroudColorForPromoAdv,
			titleFontSize: 24,
			titleText: "Бесплатная доставка",
			subtitleText: "за приведенного друга"
		)
	}
}

//MARK: Действие кнопки "Рассчитать"
private extension CalculationContentView {
	
	func configureButtonCalcDelivery() {
		let button = CustomButtonFactory.make(withTitle: UIConstants.Calculation.ButtonNames.calculate)
		
		button.snp.makeConstraints {
			$0.height.equalTo(UIConstants.Calculation.Heights.button)
		}
		
		deliveryCalculationStackView.addArrangedSubview(button)
		
		button.addTarget(self, action: #selector(buttonCalcDeliveryTapped), for: .touchUpInside)
	}
	
	@objc
	func buttonCalcDeliveryTapped() {
		delegate?.didTapCalculateDelivery()
	}
}

//MARK: Обновление cityField

