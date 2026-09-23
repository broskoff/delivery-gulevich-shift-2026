import UIKit

protocol ShipmentAssemblyProtocol: AnyObject {
	
	func createDeliveryMethodScreen(output: ShipmentOutputProtocol) -> UIViewController
	func createRecipientScreen(output: ShipmentOutputProtocol) -> UIViewController
	func createSenderScreen(output: ShipmentOutputProtocol) -> UIViewController
}

final class ShipmentAssembly: ShipmentAssemblyProtocol {
	
	func createDeliveryMethodScreen(output: ShipmentOutputProtocol) -> UIViewController {
		let presenter = DeliveryMethodPresenter(output: output)
		let deliveryMethodContentView = DeliveryMethodContentView()
		let deliveryMethodView = DeliveryMethodViewController(
			deliveryMethodContentView: deliveryMethodContentView,
			presenter: presenter
		)
		
		presenter.view = deliveryMethodView
		return deliveryMethodView
	}
	
	func createRecipientScreen(output: ShipmentOutputProtocol) -> UIViewController {
		let presenter = RecipientPresenter(output: output)
		let recipientContentView = RecipientContentView()
		let recipientView = RecipientViewController(
			recipientContentView: recipientContentView,
			presenter: presenter
		)
		
		presenter.view = recipientView
		return recipientView
	}
	
	func createSenderScreen(output: ShipmentOutputProtocol) -> UIViewController {
		let presenter = SenderPresenter(output: output)
		let senderContentView = SenderContentView()
		let senderView = SenderViewController(
			senderContentView: senderContentView,
			presenter: presenter
		)
		
		presenter.view = senderView
		return senderView
	}
	
	func createSenderAddressScreen(output: ShipmentOutputProtocol) -> UIViewController {
		
		let presenter = SenderAddressPresenter(output: output)
		let senderAddressContentView = SenderAddressContentView()
		let senderAddressView = SenderAddressViewController(
			senderAddressContentView: senderAddressContentView,
			presenter: presenter
		)
		
		presenter.view = senderAddressView
		return senderAddressView
	}
}
