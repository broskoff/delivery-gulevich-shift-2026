import UIKit

struct AdvBannerLabelConfig {
	let text: String
	let fontSize: CGFloat
	let fontWeight: UIFont.Weight
}

final class AdvBannerLabelFactory {
	
	static func createLabel(config: AdvBannerLabelConfig) -> UILabel {
		
		let label = UILabel()
		label.text = config.text
		label.textAlignment = .left
		label.textColor = .white
		label.font = .systemFont(ofSize: config.fontSize, weight: config.fontWeight)
		return label
	}
}

