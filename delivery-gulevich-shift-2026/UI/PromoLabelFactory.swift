import Foundation
import UIKit

struct PromoLabelConfig {
	let text: String
	let fontSize: CGFloat
	let fontWeight: UIFont.Weight
}

final class PromoLabelFactory {
	
	static func createLabel(config: PromoLabelConfig) -> UILabel {
		
		let label = UILabel()
		label.text = config.text
		label.textAlignment = .left
		label.textColor = .white
		label.font = .systemFont(ofSize: config.fontSize, weight: config.fontWeight)
		return label
	}
}
