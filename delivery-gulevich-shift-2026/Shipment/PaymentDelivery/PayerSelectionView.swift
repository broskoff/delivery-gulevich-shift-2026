import UIKit
import SnapKit

enum Payer: String {
	case recipient = "Получатель"
	case sender = "Отправитель"
}

final class PayerSelectionView: UIView {
	
	var onTap: ((Payer) -> Void)?
	
	private var selectedPayer: Payer = .recipient
	
	private let recipientButton: UIButton = {
		let button = UIButton()
		button.isSelected = true
		button.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
		button.setImage(UIImage(systemName: "circle"), for: .normal)
		
		button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
		return button
	}()
	
	private let senderButton: UIButton = {
		let button = UIButton()
		button.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
		button.setImage(UIImage(systemName: "circle"), for: .normal)
		
		button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
		return button
	}()
	
	private let recipientTitleLabel: UILabel = {
		let label = UILabel()
		label.text = "Получатель"
		return label
	}()
	
	private let senderTitleLabel: UILabel = {
		let label = UILabel()
		label.text = "Отправитель"
		return label
	}()
	
	private let recipientStack: UIStackView = {
		let stack = UIStackView()
		stack.axis = .horizontal
		stack.spacing = 8
		return stack
	}()
	
	private let senderStack: UIStackView = {
		let stack = UIStackView()
		stack.axis = .horizontal
		stack.spacing = 8
		return stack
	}()
	
	private let stackView: UIStackView = {
		let stack = UIStackView()
		stack.axis = .vertical
		stack.spacing = 10
		return stack
	}()
	
	init() {
		super.init(frame: .zero)
		
		setHierarchy()
		setConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setHierarchy() {
		
		recipientStack.addArrangedSubview(recipientButton)
		recipientStack.addArrangedSubview(recipientTitleLabel)
		
		senderStack.addArrangedSubview(senderButton)
		senderStack.addArrangedSubview(senderTitleLabel)
		
		stackView.addArrangedSubview(recipientStack)
		stackView.addArrangedSubview(senderStack)
		
		addSubview(stackView)
	}
	
	private func setConstraints() {
		stackView.snp.makeConstraints {
			$0.top.leading.bottom.equalToSuperview()
		}
		
		recipientButton.snp.makeConstraints {
			$0.size.equalTo(24)
		}

		senderButton.snp.makeConstraints {
			$0.size.equalTo(24)
		}
	}
	
	@objc
	private func didTap(_ sender: UIButton) {
		if sender == senderButton {
			recipientButton.isSelected = false
			senderButton.isSelected = true
			selectedPayer = .sender
		} else if sender == recipientButton {
			recipientButton.isSelected = true
			senderButton.isSelected = false
			selectedPayer = .recipient
		}
	
		onTap?(selectedPayer)
	}
}
