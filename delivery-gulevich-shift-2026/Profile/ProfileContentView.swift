import UIKit
import SnapKit

protocol ProfileContentViewDelegateProtocol : AnyObject {
	func didChoiceSegment(index: Int)
}

protocol ProfileContentViewProtocol: AnyObject {
	var delegate: ProfileContentViewDelegateProtocol? { get set }
}

final class ProfileContentView: UIView, ProfileContentViewProtocol {
	
	weak var delegate: ProfileContentViewDelegateProtocol?
	let segmentedControl = UISegmentedControl(items: ["системная", "светлая", "темная"])
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configureUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension ProfileContentView{
	
	func configureUI() {
		backgroundColor = ContentColor.calculateViewBackground
		
		configureLabel()
		configureSegmentedControl()
	}
	
	func configureLabel() {
		let label = UILabel()
		
		addSubview(label)
		
		label.text = UIConstants.SectionUnderDevelopment.labelTheme
		label.textColor = ContentColor.subTitleColor
		label.numberOfLines = 0
		
		label.snp.makeConstraints {
			$0.top.equalToSuperview().offset(144)
			$0.centerX.equalToSuperview()
		}
	}
	
	func configureSegmentedControl() {
		
		addSubview(segmentedControl)
		
		segmentedControl.snp.makeConstraints {
			$0.top.equalToSuperview().offset(204)
			$0.centerX.equalToSuperview()
		}
		
		segmentedControl.addTarget(self,
								   action: #selector(choiceSegment(_:)),
								   for: .valueChanged)
	}
	
	@objc
	func choiceSegment(_ sender: UISegmentedControl) {
		delegate?.didChoiceSegment(index: sender.selectedSegmentIndex)
	}
}
