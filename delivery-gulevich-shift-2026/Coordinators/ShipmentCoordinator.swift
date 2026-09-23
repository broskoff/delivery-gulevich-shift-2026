import Foundation
import UIKit

protocol ShipmentOutputProtocol: AnyObject {
	func openRecipient(_ type: String, _ price: String, _ days: String)
	func openSender(_ surname: String, _ name: String, _ patronymic: String, _ phone: String)
	func openSenderAddress(_ surname: String, _ name: String, _ patronymic: String, _ phone: String)
}

final class ShipmentCoordinator: CoordinatorProtocol {
	
	weak var parentCoordinator: CalculationCoordinator?
	var shipmentAssembly = ShipmentAssembly()
	var navigationController: UINavigationController
	var childCoordinators: [CoordinatorProtocol] = []
	
	init(
		parentCoordinator: CalculationCoordinator?,
		navigationController: UINavigationController,
	) {
		self.parentCoordinator = parentCoordinator
		self.navigationController = navigationController
	}
	
	func start() {
		
		let deliveryMethodViewController = shipmentAssembly.createDeliveryMethodScreen(output: self)
		print("parent: \(String(describing: parentCoordinator))")
		navigationController.pushViewController(deliveryMethodViewController, animated: true)
	}

	deinit {
		print("ShipmentCoordinator deinit")
	}
}

extension ShipmentCoordinator: ShipmentOutputProtocol {
	func openRecipient(_ type: String, _ price: String, _ days: String) {
		dataToDelivery.type = type
		dataToDelivery.price = price
		dataToDelivery.days = days
		
		let recipientViewController = shipmentAssembly.createRecipientScreen(output: self)
		navigationController.pushViewController(recipientViewController, animated: true)
//		parentCoordinator?.childDidFinish(child: self)
	}
	
	func openSender(_ surname: String, _ name: String, _ patronymic: String, _ phone: String) {
		dataToDelivery.surnameRecipient = surname
		dataToDelivery.nameRecipient = name
		dataToDelivery.patronymicRecipient = patronymic
		dataToDelivery.phoneRecipient = phone
		
		let senderViewController = shipmentAssembly.createSenderScreen(output: self)
		navigationController.pushViewController(senderViewController, animated: true)
	}
	
	func openSenderAddress(_ surname: String, _ name: String, _ patronymic: String, _ phone: String) {
		dataToDelivery.surnameSender = surname
		dataToDelivery.nameSender = name
		dataToDelivery.patronymicSender = patronymic
		dataToDelivery.phoneSender = phone
		
		let senderAddressViewController = shipmentAssembly.createSenderAddressScreen(output: self)
		navigationController.pushViewController(senderAddressViewController, animated: true)
	}
}
