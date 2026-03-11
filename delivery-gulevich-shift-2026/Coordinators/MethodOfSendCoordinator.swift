import Foundation
import UIKit

final class MethodOfSendCoordinator: ICoordinator {
	
	weak var parentCoordinator: CalculationCoordinator?
	var methodOfSendAssembly = MethodOfSendAssembly()
	var navigationController: UINavigationController
	var childCoordinators: [ICoordinator] = []
	
	init(
		parentCoordinator: CalculationCoordinator?,
		navigationController: UINavigationController,
	) {
		self.parentCoordinator = parentCoordinator
		self.navigationController = navigationController
	}
	
	func start() {
		
		let methodOfSendViewController = methodOfSendAssembly.createScreen(output: self)
		navigationController.pushViewController(methodOfSendViewController, animated: true)
	}

	deinit {
		print("MethodOfSendCoordinator deinit")
	}
}

extension MethodOfSendCoordinator: IMethodOfSendPresenterOutput {
	
	func userDidFinish() {
		parentCoordinator?.childDidFinish(child: self)
	}
}
