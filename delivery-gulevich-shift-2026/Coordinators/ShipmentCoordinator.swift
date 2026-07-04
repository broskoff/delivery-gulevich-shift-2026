import Foundation
import UIKit

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

extension ShipmentCoordinator: DeliveryMethodPresenterOutputProtocol {
	//переименовать userDidFinish() когда появится конкретное действие
	func userDidFinish() {
		parentCoordinator?.childDidFinish(child: self)
	}
}
