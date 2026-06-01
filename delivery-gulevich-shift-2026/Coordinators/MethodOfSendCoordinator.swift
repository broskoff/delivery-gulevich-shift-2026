import Foundation
import UIKit

final class MethodOfSendCoordinator: CoordinatorProtocol {
	
	weak var parentCoordinator: CalculationCoordinator?
	var methodOfSendAssembly = MethodOfSendAssembly()
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
		print("parent: \(parentCoordinator)")
		navigationController.pushViewController(methodOfSendViewController, animated: true)
	}

	deinit {
		print("MethodOfSendCoordinator deinit")
	}
}

extension MethodOfSendCoordinator: IMethodOfSendPresenterOutput {
	//переименовать userDidFinish() когда появится конкретное действие
	func userDidFinish() {
		parentCoordinator?.childDidFinish(child: self)
	}
}
