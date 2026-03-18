import UIKit

struct MethodOfSendStackLabelConfig {
	let text: String
}

final class MethodOfSendStackLabelFactory {
	
	static func createLabel(config: MethodOfSendStackLabelConfig) -> UILabel {
		
		let label = UILabel()
		label.text = config.text
		label.textAlignment = .left
		label.textColor = ContentColor.subTitleColor
		return label
	}
}

