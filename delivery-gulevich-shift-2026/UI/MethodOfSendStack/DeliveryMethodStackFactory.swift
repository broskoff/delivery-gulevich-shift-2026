import UIKit

final class DeliveryMethodStackFactory {
	
	static func setStacks(
		imageName: String,
		typeDelivery: String,
		price: String,
		countDays: String
	) -> UIStackView {
		
		let stack = UIStackView()
		
		stack.backgroundColor = .clear
		stack.axis = .vertical
		stack.layer.cornerRadius = 16
		stack.layer.borderWidth = 1
		stack.layer.borderColor = ContentColor.borderLight.cgColor
		stack.spacing = 24
		
		stack.isLayoutMarginsRelativeArrangement = true
		stack.layoutMargins = .init(top: 16, left: 16, bottom: 16, right: 16)
		
		let topStackDelivery = makeTopStackDelivery(imageName: imageName,
													typeDelivery: typeDelivery,
													price: price)
		
		let stackDeliveryCountDays = setStackDeliveryCountDays(withDays: countDays)
		
		stack.addArrangedSubview(topStackDelivery)
		stack.addArrangedSubview(stackDeliveryCountDays)
		
		return stack
	}
}

private extension DeliveryMethodStackFactory {
	static func setStackDeliveryCountDays(withDays: String) -> UIStackView {
		let stack = UIStackView()
		stack.axis = .horizontal
		stack.distribution = .fill
		stack.spacing = 24
		
		let countDayLabel = UILabel()
		countDayLabel.text = withDays
		countDayLabel.font = .systemFont(ofSize: 12, weight: .regular)
		
		let labelLeft = UILabel()
		labelLeft.snp.makeConstraints {
			$0.width.equalTo(48)
		}
		
		let labelRight = UILabel()
		
		[
			labelLeft,
			countDayLabel,
			labelRight
		].forEach {
			stack.addArrangedSubview($0)
		}
		
		return stack
	}
}

private extension DeliveryMethodStackFactory {
	static func makeTopStackDelivery(imageName: String, typeDelivery: String, price: String) -> UIStackView {
		let stack = UIStackView()
		stack.axis = .horizontal
		stack.distribution = .fill
		stack.spacing = 24
		
		let imageViewLeft = UIImageView()
		
		imageViewLeft.snp.makeConstraints {
			$0.height.width.equalTo(48)
		}
		
		imageViewLeft.backgroundColor = ContentColor.ellipseColor
		imageViewLeft.layer.cornerRadius = 24
		imageViewLeft.clipsToBounds = true
		imageViewLeft.image = UIImage(named: imageName)
		imageViewLeft.contentMode = .center
		
		let buttonRight = UIButton()
		buttonRight.setImage(UIImage(named: "iconRight"), for: .normal)
		buttonRight.snp.makeConstraints {
			$0.width.equalTo(24)
		}
		
		
		let stackTypeAndPrice = makeStackTypeAndPrice(typeDelivery: typeDelivery, price: price)
		
		stack.addArrangedSubview(imageViewLeft)
		stack.addArrangedSubview(stackTypeAndPrice)
		stack.addArrangedSubview(buttonRight)
		
		return stack
	}
}

private extension DeliveryMethodStackFactory {
	static func makeStackTypeAndPrice(typeDelivery: String, price: String) -> UIStackView {
		let stack = UIStackView()
		stack.axis = .vertical
		stack.spacing = 8
		
		let typeLabel = UILabel()
		typeLabel.text = typeDelivery
		typeLabel.font = .systemFont(ofSize: 12, weight: .regular)
		
		let priceLabel = UILabel()
		priceLabel.text = price
		priceLabel.font = .systemFont(ofSize: 24, weight: .semibold)
		
		stack.addArrangedSubview(typeLabel)
		stack.addArrangedSubview(priceLabel)
		
		return stack
	}
}
