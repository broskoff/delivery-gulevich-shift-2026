import UIKit
import SnapKit

final class ProgressBarComponent: UIView {
	
	private let stepsProgressLabel = UILabel()
	private let stepProgressBar = UIProgressView()
	private let stackView = UIStackView()
	
	init(currentStep: Int, totalSteps: Int) {
		super.init(frame: .zero)
		
		setupHierarchy()
		configureStackView()
		configureContent(currentStep: currentStep, totalSteps: totalSteps)
		setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

private extension ProgressBarComponent {
	func setupHierarchy() {
		addSubview(stackView)
		
		stackView.addArrangedSubview(stepsProgressLabel)
		stackView.addArrangedSubview(stepProgressBar)
	}
	
	func configureStackView() {
		stackView.axis = .vertical
		stackView.spacing = 8
		
		layoutMargins = UIEdgeInsets(
			top: 8,
			left: 0,
			bottom: 8,
			right: 0
		)
	}
	
	func configureContent(currentStep: Int, totalSteps: Int)  {
		stepsProgressLabel.text = "Шаг \(currentStep) из \(totalSteps)"
		
		stepProgressBar.progress = Float(currentStep) / Float(totalSteps)
		stepProgressBar.progressTintColor = .green
	}
	
	func setupConstraints() {
		stackView.snp.makeConstraints {
			$0.edges.equalTo(layoutMarginsGuide)
		}
	}
}
