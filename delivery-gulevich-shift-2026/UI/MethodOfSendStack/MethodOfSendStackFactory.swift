import UIKit

final class MethodOfSendStackViewFactory: UIView {
	
	static func create() -> UIStackView {
		
		let methodOfSendStackView = UIStackView()
		methodOfSendStackView.backgroundColor = .clear
		methodOfSendStackView.axis = .vertical
		methodOfSendStackView.layer.cornerRadius = 16
		methodOfSendStackView.layer.borderWidth = 1
		methodOfSendStackView.layer.borderColor = ContentColor.borderLight.cgColor
		
		methodOfSendStackView.isLayoutMarginsRelativeArrangement = true
		methodOfSendStackView.layoutMargins = .init(top: 16, left: 16, bottom: 16, right: 16)
		
		let titleLabelConfig = MethodOfSendStackLabelConfig(text: "Экспресс доставка до двери")
		let titleLabel = MethodOfSendStackLabelFactory.createLabel(config: titleLabelConfig)
		
		let subtitleLabelConfig = MethodOfSendStackLabelConfig(text: "1 рабочий день")
		let subtitlelabel = MethodOfSendStackLabelFactory.createLabel(config: subtitleLabelConfig)
		
		[
			titleLabel,
			subtitlelabel
		].forEach {
			methodOfSendStackView.addArrangedSubview($0)
		}
		
		return methodOfSendStackView
	}
}

