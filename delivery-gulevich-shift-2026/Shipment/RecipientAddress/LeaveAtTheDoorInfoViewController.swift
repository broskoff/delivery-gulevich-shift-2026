import UIKit
import SnapKit

final class LeaveAtTheDoorInfoViewController: UIViewController {
	
	private let presentationTransitionDelegate = LeaveAtTheDoorTransitioningDelegate()
	
	private let titleStackView = {
		let stack = UIStackView()
		stack.axis = .horizontal
		return stack
	}()
	
	private let titleLabel = {
		let label = UILabel()
		label.text = UIConstants.Shipment.RecipientAddress.titleContactFreeDelivery
		label.font = .systemFont(ofSize: 12, weight: .semibold)
		return label
	}()
	
	private let infoLabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 12, weight: .regular)
		label.textColor = .gray
		label.text = UIConstants.Shipment.RecipientAddress.descriptionContactFreeDelivery
		label.numberOfLines = 0
		label.lineBreakMode = .byWordWrapping
		return label
	}()
	
	private let closeButton = UIButton()
	
	init() {
		super.init(nibName: nil, bundle: nil)
		transitioningDelegate = self.presentationTransitionDelegate
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configureUI()
		configureCloseButton()
	}
	
	private func configureCloseButton() {
		closeButton.setImage(UIImage(named: "Vector"), for: .normal)
		closeButton.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
		
		closeButton.setContentCompressionResistancePriority(.required, for: .horizontal)
	}
	
	@objc
	private func didTapCloseButton() {
		dismiss(animated: true)
	}
}

private extension LeaveAtTheDoorInfoViewController {
	func configureUI () {
		view.backgroundColor = .white
		view.layer.cornerRadius = 8
		
		setShadow()
		setHierarchy()
		setConstraints()
	}
	
	func setShadow() {
		view.layer.shadowColor = UIColor.black.cgColor
		view.layer.shadowOpacity = 0.2
		view.layer.shadowOffset = CGSize(width: 0, height: 4)
		view.layer.shadowRadius = 4
	}
	
	func setHierarchy() {
		[
			titleStackView,
			infoLabel
		].forEach {
			view.addSubview($0)
		}
		
		[
			titleLabel,
			closeButton
		].forEach {
			titleStackView.addArrangedSubview($0)
		}
	}
	
	func setConstraints() {
		titleStackView.snp.makeConstraints {
			$0.top.leading.trailing.equalTo(view).inset(8)
		}
		
		closeButton.snp.makeConstraints {
			$0.size.equalTo(24)
		}
		
		infoLabel.snp.makeConstraints {
			$0.top.equalTo(titleStackView.snp.bottom)
			$0.leading.trailing.equalTo(view).inset(8)
			$0.bottom.equalTo(view).inset(8)
		}
	}
}
