import UIKit
import SnapKit

final class CalculationView: UIView {
	
	private let scrollView = UIScrollView(frame: .zero)
	private let stackView = UIStackView()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configureUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

private extension CalculationView {

	func configureUI() {
		backgroundColor = .green
		
		configureScrollView()
	}
	
	func configureScrollView() {
		addSubview(scrollView)
		
		scrollView.bouncesHorizontally = false
		scrollView.alwaysBounceVertical = true
		scrollView.backgroundColor = .yellow
		
		scrollView.snp.makeConstraints {
			$0.edges.equalTo(safeAreaLayoutGuide)
		}
	}
}
