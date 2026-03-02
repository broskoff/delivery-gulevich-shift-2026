import Foundation
import UIKit

final class MethodOfSendCoordinator: IMethodOfSendCoordinator {
	
	weak var parentCoordinator: MainCoordinator?
	var methodOfSendAssembly: IMethodOfSendAssembly
	
	var navigationController: UINavigationController
	var childCoordinators: [ICoordinator] = []
	
	init(
		parentCoordinator: MainCoordinator?,
		navigationController: UINavigationController,
		methodOfSendAssembly: IMethodOfSendAssembly
	) {
		self.parentCoordinator = parentCoordinator
		self.navigationController = navigationController
		self.methodOfSendAssembly = methodOfSendAssembly
	}
	
	func start() {
		let methodOfSendViewController = methodOfSendAssembly.createScreen(coordinator: self)
		navigationController.pushViewController(methodOfSendViewController, animated: true)
	}
	
	func didFinish() {
		parentCoordinator?.childDidFinish(child: self)
	}
	
	deinit {
		print("MethodOfSendCoordinator deinit")
	}
}
