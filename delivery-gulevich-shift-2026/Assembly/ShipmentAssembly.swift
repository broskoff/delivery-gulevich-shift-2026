import UIKit

protocol ShipmentAssemblyProtocol: AnyObject {
	
	func createScreen(output: DeliveryMethodPresenterOutputProtocol) -> UIViewController
}

final class ShipmentAssembly: ShipmentAssemblyProtocol {
	
	func createScreen(output: DeliveryMethodPresenterOutputProtocol) -> UIViewController {
		let presenter = DeliveryMethodPresenter(output: output)
		let methodContentView = DeliveryMethodContentView()
		let methodOfSendView = DeliveryMethodViewController(
			methodOfSendContentView: methodContentView,
			presenter: presenter
		)
		
		presenter.view = methodOfSendView
		return methodOfSendView
	}
}
