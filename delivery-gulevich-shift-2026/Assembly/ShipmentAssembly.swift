import UIKit

protocol ShipmentAssemblyProtocol: AnyObject {
	
	func createDeliveryMethodScreen(output: DeliveryMethodPresenterOutputProtocol) -> UIViewController
}

final class ShipmentAssembly: ShipmentAssemblyProtocol {
	
	func createDeliveryMethodScreen(output: DeliveryMethodPresenterOutputProtocol) -> UIViewController {
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
