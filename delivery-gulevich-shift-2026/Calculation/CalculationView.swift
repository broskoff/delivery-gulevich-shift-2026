import UIKit
import SnapKit

final class CalculationView: UIView {
	
	private let topView = UIView()
	private let scrollView = UIScrollView(frame: .zero)
	private let contentView = UIView(frame: .zero)
	private let mainStackView = UIStackView()
	
	private let titleStackView = UIStackView()
	private let calculationStackView = UIStackView()
	private let trackStackView = UIStackView()
	private let promoStackView = UIStackView()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configureUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

private extension CalculationView {
	
	func configureUI() {
		
		backgroundColor = ContentColor.viewBackground
		
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
		
		configurePromoLabel()
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
		mainStackView.spacing = 24
		
		mainStackView.snp.makeConstraints {
			$0.top.leading.trailing.equalToSuperview().inset(16)
			$0.bottom.equalToSuperview().inset(16)
		}
	}
}

private extension CalculationView {
	
	func configureTitleStackView() {
		titleStackView.axis = .vertical
		titleStackView.spacing = 8
		
		titleStackView.snp.makeConstraints {
			$0.top.equalToSuperview()
			$0.leading.trailing.equalToSuperview().inset(16)
		}
	}
	
	func configureTitleLabels() {
		let titleLabel = UILabel()
		let subtitleLabel = UILabel()
		
		titleStackView.addArrangedSubview(titleLabel)
		titleStackView.addArrangedSubview(subtitleLabel)
		
		titleLabel.text = "Мы доставим\nваш заказ"
		titleLabel.numberOfLines = 0
		titleLabel.textAlignment = .left
		titleLabel.font = .systemFont(ofSize: 30, weight: .bold)
		
		subtitleLabel.text = "Отправляйте посылки в приложении\nШифт Delivery"
		subtitleLabel.numberOfLines = 2
		subtitleLabel.textColor = ContentColor.subTitleColor
	}
	
	func configureCalculationStackView() {
		mainStackView.addArrangedSubview(calculationStackView)
		
		calculationStackView.backgroundColor = .white
		calculationStackView.axis = .vertical
		calculationStackView.spacing = 32
		
		calculationStackView.layer.cornerRadius = 16
		
		calculationStackView.isLayoutMarginsRelativeArrangement = true
		calculationStackView.layoutMargins = .init(top: 32, left: 16, bottom: 32, right: 16)
	}
	
	func configureLabelCalcDelivery() {
		let label = UILabel()
		label.text = "Рассчитать доставку"
		label.textAlignment = .center
		label.font = .systemFont(ofSize: 30, weight: .bold)
		
		calculationStackView.addArrangedSubview(label)
	}
	
	func configureButtonCalcDelivery() {
		let button = CustomButton.makeButton(setTitle: "Рассчитать")
		
		calculationStackView.addArrangedSubview(button)
	}
}

private extension CalculationView {
	
	func configureUserFields() {
		let departureCityTextField = CustomTextField(frame: .zero)
		let departureCityConfig = CustomTextFieldConfig(
			tagType: .fromCity,
			label: "Город отправки",
			placeholder: "Выберите город",
			boarderColor: ContentColor.borderLight
		)
		
		departureCityTextField.makeComponent(
			delegate: self,
			config: departureCityConfig
		)
		
		let destinationCityTextField = CustomTextField(frame: .zero)
		let destinationCityConfig = CustomTextFieldConfig(
			tagType: .toCity,
			label: "Город назначения",
			placeholder: "Выберите город",
			boarderColor: ContentColor.borderLight
		)
		
		destinationCityTextField.makeComponent(
			delegate: self,
			config: destinationCityConfig
		)
		
		let sizePackegeTextField = CustomTextField(frame: .zero)
		let sizePackegeConfig = CustomTextFieldConfig(
			tagType: .sizePackage,
			label: "Размер посылки",
			placeholder: "Выберите размер",
			boarderColor: ContentColor.borderLight
		)
		
		sizePackegeTextField.makeComponent(
			delegate: self,
			config: sizePackegeConfig
		)
		
		let stackView = UIStackView()
		stackView.backgroundColor = .white
		stackView.axis = .vertical
		stackView.spacing = 16
		
		[
			departureCityTextField,
			destinationCityTextField,
			sizePackegeTextField
		].forEach {
			stackView.addArrangedSubview($0)
		}
		
		calculationStackView.addArrangedSubview(stackView)
	}
}

private extension CalculationView {
	
	func configureTrackStackView() {
		mainStackView.addArrangedSubview(trackStackView)
		
		trackStackView.backgroundColor = .white
		trackStackView.axis = .vertical
		trackStackView.spacing = 32
		
		trackStackView.layer.cornerRadius = 16
		
		trackStackView.isLayoutMarginsRelativeArrangement = true
		trackStackView.layoutMargins = .init(top: 32, left: 16, bottom: 32, right: 16)
	}
	
	func configureTrackLabel() {
		let label = UILabel()
		label.text = "Отследить посылку"
		label.textAlignment = .center
		label.font = .systemFont(ofSize: 30, weight: .bold)
		
		trackStackView.addArrangedSubview(label)
	}
	
	func configureTrackTextField() {
		let textField = UITextField()
		
		textField.placeholder = "Номер заказа"
		textField.layer.cornerRadius = 8
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
		let button = CustomButton.makeButton(setTitle: "Найти")
		
		trackStackView.addArrangedSubview(button)
	}
}

private extension CalculationView {
	
	func configurePromoStackView() {
		mainStackView.addArrangedSubview(promoStackView)

		promoStackView.backgroundColor = ContentColor.promoAdvStackView
		promoStackView.axis = .vertical
		
		promoStackView.layer.cornerRadius = 16
		
		promoStackView.isLayoutMarginsRelativeArrangement = true
		promoStackView.layoutMargins = .init(top: 16, left: 16, bottom: 16, right: 16)
	}
	
	func configurePromoLabel() {
		let titleLabel = UILabel()
		titleLabel.text = "Бесплатная доставка"
		titleLabel.textAlignment = .left
		titleLabel.textColor = .white
		titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
		
		let subtitlelabel = UILabel()
		subtitlelabel.text = "за приведенного друга"
		subtitlelabel.textAlignment = .left
		subtitlelabel.textColor = .white
		subtitlelabel.font = .systemFont(ofSize: 14, weight: .light)
		
		[
			titleLabel,
			subtitlelabel
		].forEach {
			promoStackView.addArrangedSubview($0)
		}
	}
}

extension CalculationView: UITextFieldDelegate {
	//
	//	func textFieldDidEndEditing(_ textField: UITextField) {
	//		guard let text = textField.text else { return }
	//
	//		switch textField.tag {
	//		case 0:
	//			packageData.departureCity = text
	//		case 1:
	//			packageData.destinationCity = text
	//		case 2:
	//			packageData.sizePackage = text
	//		default:
	//			fatalError()
	//		}
	//	}
}

