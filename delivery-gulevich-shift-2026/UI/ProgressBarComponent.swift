import UIKit

final class ProgressBarComponent: UIView {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func makeComponent(currentStep: Int, totalSteps: Int)  {
		layoutMargins = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
		
		let stepsProgresslabel = UILabel()
		stepsProgresslabel.text = "Шаг \(currentStep) из \(totalSteps)"
		
		addSubview(stepsProgresslabel)
		
		stepsProgresslabel.snp.makeConstraints {
			$0.edges.equalTo(layoutMarginsGuide)
		}
		
		let stepProgressBar = UIProgressView()
		stepProgressBar.progress = Float(currentStep) / Float(totalSteps)
		stepProgressBar.progressTintColor = .green
		addSubview(stepProgressBar)
		
		stepProgressBar.snp.makeConstraints {
			$0.top.equalTo(stepsProgresslabel.snp.bottom).offset(8)
			$0.leading.trailing.equalTo(layoutMarginsGuide)
		}
	}
}
