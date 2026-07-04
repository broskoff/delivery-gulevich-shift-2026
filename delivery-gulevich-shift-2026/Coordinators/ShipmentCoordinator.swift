import Foundation
import UIKit

final class ShipmentCoordinator: CoordinatorProtocol {
	
	weak var parentCoordinator: CalculationCoordinator?
	var methodOfSendAssembly = ShipmentAssembly()
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
		
		let methodOfSendViewController = methodOfSendAssembly.createScreen(output: self)
		print("parent: \(String(describing: parentCoordinator))")
		navigationController.pushViewController(methodOfSendViewController, animated: true)
	}

	deinit {
		print("MethodOfSendCoordinator deinit")
	}
}

extension ShipmentCoordinator: DeliveryMethodPresenterOutputProtocol {
	//переименовать userDidFinish() когда появится конкретное действие
	func userDidFinish() {
		parentCoordinator?.childDidFinish(child: self)
	}
}
