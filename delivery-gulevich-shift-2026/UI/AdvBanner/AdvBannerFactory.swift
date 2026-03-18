import UIKit

final class AdvBannerFactory: UIView {
	
	static func createAdvBannerStackView(backgroundColor: UIColor,
								  titleFontSize: CGFloat,
								  titleText: String,
								  subtitleText: String) -> UIStackView {
		
		let advBannerStackView = UIStackView()
		advBannerStackView.backgroundColor = backgroundColor
		advBannerStackView.axis = .vertical
		advBannerStackView.layer.cornerRadius = 16
		
		advBannerStackView.isLayoutMarginsRelativeArrangement = true
		advBannerStackView.layoutMargins = .init(top: 16, left: 16, bottom: 16, right: 16)
		
		let titleLabelConfig = AdvBannerLabelConfig(text: titleText,
												fontSize: titleFontSize,
												fontWeight: .bold)
		
		let titleLabel = AdvBannerLabelFactory.createLabel(config: titleLabelConfig)
		
		let subtitleLabelConfig = AdvBannerLabelConfig(text: subtitleText,
												   fontSize: 14,
												   fontWeight: .light)
		
		let subtitlelabel = AdvBannerLabelFactory.createLabel(config: subtitleLabelConfig)
		
		[
			titleLabel,
			subtitlelabel
		].forEach {
			advBannerStackView.addArrangedSubview($0)
		}
		
		return advBannerStackView
	}
}
