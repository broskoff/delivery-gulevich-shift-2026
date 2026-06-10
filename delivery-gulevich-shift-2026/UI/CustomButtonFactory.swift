import UIKit
import SnapKit

final class CustomButtonFactory {
	
	static func make(withTitle: String) -> UIButton {
		let button = UIButton(type: .system)
		var config = UIButton.Configuration.bordered()
		
		config.baseBackgroundColor = ContentColor.colorButton
		config.title = withTitle
		config.baseForegroundColor = .white
		config.background.cornerRadius = UIConstants.Layer.CornerRadius.small
		button.configuration = config
		
		return button
	}
}
