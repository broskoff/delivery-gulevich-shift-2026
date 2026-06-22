import UIKit

final class PromoBanner: UIStackView {
	
	private let titleLabel = UILabel()
	private let subtitlelabel = UILabel()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupView()
		setupHierarchy()
	}
	
	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure(backgroundColor: UIColor,
				   titleFontSize: CGFloat,
				   titleText: String,
				   subtitleText: String) {
		
		self.backgroundColor = backgroundColor
		
		configureTitleLabel(titleText, titleFontSize)
		configureSubtitleLabel(subtitleText, fontSize: 14)
	}
}

private extension PromoBanner {
	
	func configureTitleLabel(_ titleText: String, _ titleFontSize: CGFloat) {
		titleLabel.text = titleText
		titleLabel.textAlignment = .left
		titleLabel.textColor = .white
		titleLabel.font = .systemFont(ofSize: titleFontSize, weight: .bold)
	}
	
	func configureSubtitleLabel(_ subtitleText: String, fontSize: CGFloat) {
		subtitlelabel.text = subtitleText
		subtitlelabel.textAlignment = .left
		subtitlelabel.textColor = .white
		subtitlelabel.font = .systemFont(ofSize: fontSize, weight: .light)
	}
	
	func setupView() {
		self.axis = .vertical
		self.layer.cornerRadius = UIConstants.Layer.CornerRadius.small
		
		self.isLayoutMarginsRelativeArrangement = true
		self.layoutMargins = .init(top: 16, left: 16, bottom: 16, right: 16)
	}
	
	func setupHierarchy() {
		[titleLabel, subtitlelabel].forEach {
			self.addArrangedSubview($0)
		}
	}
}

