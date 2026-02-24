import Foundation
import UIKit

final class MethodOfSendCoordinator: IMethodOfSendCoordinator {
	
	weak var parentCoordinator: MainCoordinator?
	
	var navigationController: UINavigationController?
	var childCoordinators: [ICoordinator] = []
	
	init(parentCoordinator: MainCoordinator?) {
		self.parentCoordinator = parentCoordinator
	}
	
	func start() {
		let view = MethodOfSendView()
		let presenter = MethodOfSendPresenter(coordinator: self)
		let methodOfSendViewController = MethodOfSendViewController(methodOfSendView: view, presenter: presenter)
		navigationController?.pushViewController(methodOfSendViewController, animated: true)
	}
	
	func didFinish() {
		parentCoordinator?.childDidFinish(child: self)
	}
	
	deinit {
		print("MethodOfSendCoordinator deinit")
	}
}
