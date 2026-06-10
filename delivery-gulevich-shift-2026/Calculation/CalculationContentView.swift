import UIKit
import SnapKit

protocol ICalculationContentViewDelegate: AnyObject {
	func didTapCalculateDelivery()
	func didTapTrackParcel()
	
	func didTapCitySelectedField()
	func didTapPackageSizeField()
}

protocol ICalculationContentView : AnyObject {
	var delegate: ICalculationContentViewDelegate? { get set }
}

final class CalculationContentView: UIView, ICalculationContentView {
	
	weak var delegate: ICalculationContentViewDelegate?
	
	private let topView = UIView()
	private let scrollView = UIScrollView()
	private let contentView = UIView()
	private let mainStackView = UIStackView()
	
	private let titleStackView = UIStackView()
	private let calculationStackView = UIStackView()
	private let trackStackView = UIStackView()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configureUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

private extension CalculationContentView {
	
	func configureUI() {
		
		backgroundColor = ContentColor.calculateViewBackground
		
		configureView()
		
		configureTopView()
		
		configureScrollView()
		
		configureContentView()
		
		configureMainStackView()
		
		configureTitleStackView()
		
		configureTitleLabels()
		
		configureCalculationStackView()
		
		configureLabelCalcDelivery()
		
		configureUserFields()
		
		configureButtonCalcDelivery()
		
		configureTrackStackView()
		
		configureTrackLabel()
		
		configureTrackTextField()
		
		configureButtonTrack()
		
		configurePromoStackView()
	}
	
	func configureView() {
		addSubview(topView)
		addSubview(scrollView)
		
		scrollView.addSubview(contentView)
		contentView.addSubview(mainStackView)
	}
	
	func configureTopView() {
		topView.addSubview(titleStackView)
		
		topView.snp.makeConstraints {
			$0.top.equalToSuperview().offset(64)
			$0.leading.trailing.equalToSuperview()
			$0.height.equalTo(140)
		}
	}
	
	func configureScrollView() {
		scrollView.bouncesHorizontally = false
		scrollView.alwaysBounceVertical = true
		
		scrollView.snp.makeConstraints {
			$0.top.equalTo(topView.snp.bottom)
			$0.leading.trailing.equalToSuperview()
			$0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
		}
	}
	
	func configureContentView() {
		contentView.snp.makeConstraints {
			$0.edges.equalToSuperview()
			$0.width.equalToSuperview()
		}
	}
	
	func configureMainStackView() {
		mainStackView.axis = .vertical
		mainStackView.spacing = UIConstants.Spacing.medium
		
		mainStackView.snp.makeConstraints {
			$0.top.leading.trailing.equalToSuperview().inset(UIConstants.Inset.small)
			$0.bottom.equalToSuperview().inset(UIConstants.Inset.small)
		}
	}
}

private extension CalculationContentView {
	
	func configureTitleStackView() {
		titleStackView.axis = .vertical
		titleStackView.spacing = UIConstants.Spacing.extraSmall
		
		titleStackView.snp.makeConstraints {
			$0.top.equalToSuperview()
			$0.leading.trailing.equalToSuperview().inset(UIConstants.Inset.small)
		}
	}
	
	func configureTitleLabels() {
		let titleLabel = UILabel()
		let subtitleLabel = UILabel()
		
		titleStackView.addArrangedSubview(titleLabel)
		titleStackView.addArrangedSubview(subtitleLabel)
		
		titleLabel.text = UIConstants.Calculation.HeaderNames.title
		titleLabel.numberOfLines = 0
		titleLabel.textAlignment = .left
		titleLabel.font = .systemFont(ofSize: 30, weight: .bold)
		
		subtitleLabel.text = UIConstants.Calculation.HeaderNames.subtitle
		subtitleLabel.numberOfLines = 2
		subtitleLabel.textColor = ContentColor.subTitleColor
	}
	
	func configureCalculationStackView() {
		mainStackView.addArrangedSubview(calculationStackView)
		
		calculationStackView.backgroundColor = .white
		calculationStackView.axis = .vertical
		calculationStackView.spacing = UIConstants.Spacing.medium
		
		calculationStackView.layer.cornerRadius = UIConstants.Layer.CornerRadius.medium
		
		calculationStackView.isLayoutMarginsRelativeArrangement = true
		calculationStackView.layoutMargins = .init(top: 32, left: 16, bottom: 32, right: 16)
	}
	
	func configureLabelCalcDelivery() {
		let label = UILabel()
		label.text = UIConstants.Calculation.CardNames.calculate
		label.textAlignment = .center
		label.font = .systemFont(ofSize: 30, weight: .bold)
		
		calculationStackView.addArrangedSubview(label)
	}
}

private extension CalculationContentView {
	func configureShipmentFields() {
		let departureCityConfig = SelectionFieldConfig(
			tagType: .departureCity,
			placeholder: "Выберите город",
			leftIconName: "IconLocation"
		)
		
		let departureField = FormFieldFactory.make(
			title: "Город отправки",
			config: departureCityConfig,
			delegate: self
		)
		
		let destinationCityConfig = SelectionFieldConfig(
			tagType: .departureCity,
			placeholder: "Выберите город",
			leftIconName: "pointer"
		)
		
		let destinationField = FormFieldFactory.make(
			title: "Город назначения",
			config: destinationCityConfig,
			delegate: self
		)
		
		let sizePackageConfig = SelectionFieldConfig(
			tagType: .sizePackage,
			placeholder: "Конверт",
			leftIconName: "IconEnvelope"
		)
		
		let sizePackageField = FormFieldFactory.make(
			title: "Размер посылки",
			config: sizePackageConfig,
			delegate: self
		)
		
		let stackView = UIStackView()
		stackView.backgroundColor = .white
		stackView.axis = .vertical
		stackView.spacing = UIConstants.Spacing.medium
		
		[
			departureField,
			destinationField,
			sizePackageField
		].forEach {
			stackView.addArrangedSubview($0)
		}
		
		calculationStackView.addArrangedSubview(stackView)
	}
}

private extension CalculationContentView {
	
	func configureTrackStackView() {
		mainStackView.addArrangedSubview(trackStackView)
		
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
	
	func configureButtonTrack() {
		let button = CustomButton.makeButton(setTitle: UIConstants.Calculation.ButtonNames.find)
		
		trackStackView.addArrangedSubview(button)
		
		button.addTarget(self, action: #selector(buttonTrackTapped), for: .touchUpInside)
	}
	
	
	//MARK: Действие кнопки "Найти"
	@objc
	func buttonTrackTapped() {
		delegate?.didTapTrackParcel()
	print("нажали кнопку Найти. Это напечатано из CalculationContentView 3")
	}
}

private extension CalculationContentView {
	
	func configurePromoStackView() {
		let advBanner = AdvBannerFactory.createAdvBannerStackView(
			backgroundColor: ContentColor.brownBackgroudColorForPromoAdv,
			titleFontSize: 24,
			titleText: "Бесплатная доставка",
			subtitleText: "за приведенного друга"
		)
		
		mainStackView.addArrangedSubview(advBanner)
	}
}

//MARK: Действие "Рассчитать" находится тут
private extension CalculationContentView {
	
	func configureButtonCalcDelivery() {
		let button = CustomButton.makeButton(setTitle: UIConstants.Calculation.ButtonNames.calculate)
		
		calculationStackView.addArrangedSubview(button)
		
		button.addTarget(self, action: #selector(buttonCalcDeliveryTapped), for: .touchUpInside)
	}
	
	@objc
	func buttonCalcDeliveryTapped() {
		delegate?.didTapCalculateDelivery()
	}
}

//MARK: "Выбрать город или Размер посылки"
extension CalculationContentView: ICustomControlField {
	func didTapCitySelectedField() {
		
		delegate?.didTapCitySelectedField()
	}
	
	func didTapPackageSizeField() {
		delegate?.didTapPackageSizeField()
	}
}
