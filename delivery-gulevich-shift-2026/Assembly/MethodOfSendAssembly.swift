import UIKit

protocol IMethodOfSendAssembly: AnyObject {
	
	func createScreen(coordinator: IMethodOfSendCoordinator) -> UIViewController
}

final class MethodOfSendAssembly: IMethodOfSendAssembly {
	
	func createScreen(coordinator: IMethodOfSendCoordinator) -> UIViewController {
		let presenter = MethodOfSendPresenter(coordinator: coordinator)
		let methodContentView = MethodOfSendContentView()
		let methodOfSendView = MethodOfSendViewController(
			methodOfSendContentView: methodContentView,
			presenter: presenter
		)
		
		presenter.view = methodOfSendView
		return methodOfSendView
	}
}
