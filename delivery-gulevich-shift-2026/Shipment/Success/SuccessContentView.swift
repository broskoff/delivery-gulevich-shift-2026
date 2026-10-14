import UIKit
import SnapKit

protocol SuccessContentViewProtocol: AnyObject {
	var onTap: (() -> Void)? { get set }
}

final class SuccessContentView: UIView & SuccessContentViewProtocol {
	
	var onTap: (() -> Void)?
	
	private let mainStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.spacing = UIConstants.Spacing.forty
		stackView.alignment = .center
		
		return stackView
	}()
	
	private let headingStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.spacing = UIConstants.Spacing.small
		stackView.alignment = .center
		
		return stackView
	}()
	
	private let successImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: UIConstants.Success.acceptImage)
		imageView.contentMode = .center
		return imageView
	}()
	
	private let titleLabel = {
		let label = UILabel()
		label.text = UIConstants.Success.titleLabel
		label.font = .systemFont(ofSize: UIConstants.Success.titleLabelFontSize,
								 weight: .semibold)
		label.textColor = .black
		return label
	}()
	
	private let descriptionLabel = {
		let label = UILabel()
		label.text = UIConstants.Success.descriptionLabel
		label.numberOfLines = 0
		label.lineBreakMode = .byWordWrapping
		label.textAlignment = .center
		label.font = .systemFont(ofSize: UIConstants.Success.descriptionLabelFontSize,
								 weight: .regular)
		label.textColor = .systemGray
		return label
	}()
	
	private let viewStatusButton = BigBlueButtonFactory.make(
		withTitle: UIConstants.BigBlueButton.viewStatusButton
	)
		
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configureUI()
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configureUI() {
		backgroundColor = ContentColor.shipmentBackground
		
		setupHierarchy()
		setupConstraints()
	}
}

private extension SuccessContentView {
	func setupHierarchy() {
		[
			successImageView,
			titleLabel,
			descriptionLabel
		].forEach {
			headingStackView.addArrangedSubview($0)
		}
		
		mainStackView.addArrangedSubview(headingStackView)
		mainStackView.addArrangedSubview(viewStatusButton)
		
		addSubview(mainStackView)
	}
	
	func setupConstraints() {
		
		successImageView.snp.makeConstraints {
			$0.width.height.equalTo(UIConstants.Success.successImageViewSize)
		}
		
		headingStackView.snp.makeConstraints {
			$0.height.equalTo(UIConstants.Success.headingStackViewHeight)
			$0.width.equalToSuperview()
		}
		
		viewStatusButton.snp.makeConstraints {
			$0.leading.trailing.equalToSuperview()
			$0.height.equalTo(UIConstants.BigBlueButton.heightButton)
		}
		
		mainStackView.snp.makeConstraints {
			$0.centerY.centerX.equalToSuperview()
			$0.width.equalTo(UIConstants.Success.mainStackViewWidth)
		}
	}
}
