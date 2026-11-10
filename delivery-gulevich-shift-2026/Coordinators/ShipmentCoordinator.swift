import Foundation
import UIKit

protocol ShipmentOutputProtocol: AnyObject {
	func openRecipient(_ type: String, _ price: String, _ days: String)
	func openSender(_ surname: String, _ name: String, _ patronymic: String, _ phone: String)
	func openSenderAddress(_ surname: String, _ name: String, _ patronymic: String, _ phone: String)
	func openRecipientAddress(_ street: String, _ house: String, _ apartment: String, _ note: String)
	func openPaymentDelivery(_ street: String, _ house: String, _ apartment: String, _ note: String, _ leaveAtTheDoor: Bool)
	func openDataValidation(_ payer: String)
	func openSuccess()
}

final class ShipmentCoordinator: CoordinatorProtocol {
	
	weak var parentCoordinator: CalculationCoordinator?
	var shipmentAssembly = ShipmentAssembly()
	var navigationController: UINavigationController
	var childCoordinators: [CoordinatorProtocol] = []
	var dataToDelivery = DataToDelivery()
	
	init(
		parentCoordinator: CalculationCoordinator?,
		navigationController: UINavigationController,
	) {
		self.parentCoordinator = parentCoordinator
		self.navigationController = navigationController
	}
	
	func start() {
		
		let deliveryMethodViewController = shipmentAssembly.createDeliveryMethodScreen(output: self)
		navigationController.pushViewController(deliveryMethodViewController, animated: true)
	}

	deinit {
		print("ShipmentCoordinator deinit")
	}
}

extension ShipmentCoordinator: ShipmentOutputProtocol {
	func openRecipient(_ type: String, _ price: String, _ days: String) {
		dataToDelivery.deliveryDetails.type = type
		dataToDelivery.deliveryDetails.price = price
		dataToDelivery.deliveryDetails.days = days
		
		let recipientViewController = shipmentAssembly.createRecipientScreen(output: self)
		navigationController.pushViewController(recipientViewController, animated: true)
//		parentCoordinator?.childDidFinish(child: self)
	}
	
	func openSender(_ surname: String, _ name: String, _ patronymic: String, _ phone: String) {
		dataToDelivery.recipient.surname = surname
		dataToDelivery.recipient.name = name
		dataToDelivery.recipient.patronymic = patronymic
		dataToDelivery.recipient.phone = phone
		
		let senderViewController = shipmentAssembly.createSenderScreen(output: self)
		navigationController.pushViewController(senderViewController, animated: true)
	}
	
	func openSenderAddress(_ surname: String, _ name: String, _ patronymic: String, _ phone: String) {
		dataToDelivery.sender.surname = surname
		dataToDelivery.sender.name = name
		dataToDelivery.sender.patronymic = patronymic
		dataToDelivery.sender.phone = phone
		
		let senderAddressViewController = shipmentAssembly.createSenderAddressScreen(output: self)
		navigationController.pushViewController(senderAddressViewController, animated: true)
	}
	
	func openRecipientAddress(_ street: String, _ house: String, _ apartment: String, _ note: String) {
		dataToDelivery.senderAddress.street = street
		dataToDelivery.senderAddress.house = house
		dataToDelivery.senderAddress.apartment = apartment
		dataToDelivery.senderAddress.noteForCourier = note
		
		let recipientAddressViewController = shipmentAssembly.createRecipientAddressScreen(output: self)
		navigationController.pushViewController(recipientAddressViewController, animated: true)
	}
	
	func openPaymentDelivery(_ street: String, _ house: String, _ apartment: String, _ note: String, _ leaveAtTheDoor: Bool) {
		dataToDelivery.recipientAddress.street = street
		dataToDelivery.recipientAddress.house = house
		dataToDelivery.recipientAddress.apartment = apartment
		dataToDelivery.recipientAddress.noteForCourier = note
		dataToDelivery.deliveryDetails.leaveAtTheDoor = leaveAtTheDoor
		
		let paymentDeliveryViewController = shipmentAssembly.createPaymentDeliveryScreen(output: self)
		navigationController.pushViewController(paymentDeliveryViewController, animated: true)
	}
	
	func openDataValidation(_ payer: String) {
		dataToDelivery.deliveryDetails.payer = payer
		
		let dataValidationViewController = shipmentAssembly.createDataValidationScreen(
			output: self,
			data: dataToDelivery
		)
		
		navigationController.pushViewController(dataValidationViewController, animated: true)
	}
	
	func openSuccess() {
		let successViewController = shipmentAssembly.createSuccessScreen(output: self)
		
		navigationController.pushViewController(successViewController, animated: true)
	}
}
