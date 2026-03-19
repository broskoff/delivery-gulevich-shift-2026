import UIKit
import SnapKit

final class CustomButton {
	
	static func makeButton(setTitle: String) -> UIButton {
		let button = UIButton(type: .system)
		var config = UIButton.Configuration.bordered()
		
		config.baseBackgroundColor = ContentColor.colorButton
		config.title = setTitle
		config.baseForegroundColor = .white
		config.background.cornerRadius = UIConstants.Layer.CornerRadius.small
		button.configuration = config

		button.snp.makeConstraints {
			$0.height.equalTo(56)
		}
		
		return button
	}
}
