import UIKit

protocol IMethodOfSendAssembly: AnyObject {
	
	func createScreen(coordinator: IMethodOfSendCoordinator) -> UIViewController
}

final class MethodOfSendAssembly: IMethodOfSendAssembly {
	
	func createScreen(coordinator: IMethodOfSendCoordinator) -> UIViewController {
		let view = MethodOfSendView()
		let presenter = MethodOfSendPresenter(coordinator: coordinator)
		let methodOfSendViewController = MethodOfSendViewController(
			methodOfSendView: view,
			presenter: presenter
		)
		
		return methodOfSendViewController
	}
}
