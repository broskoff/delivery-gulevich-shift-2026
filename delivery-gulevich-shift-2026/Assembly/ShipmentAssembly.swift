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
}
