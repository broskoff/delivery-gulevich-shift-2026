import UIKit

protocol IMethodOfSendAssembly: AnyObject {
	
	func createScreen(output: IMethodOfSendPresenterOutput) -> UIViewController
}

final class MethodOfSendAssembly: IMethodOfSendAssembly {
	
	func createScreen(output: IMethodOfSendPresenterOutput) -> UIViewController {
		let presenter = MethodOfSendPresenter(output: output)
		let methodContentView = MethodOfSendContentView()
		let methodOfSendView = MethodOfSendViewController(
			methodOfSendContentView: methodContentView,
			presenter: presenter
		)
		
		presenter.view = methodOfSendView
		return methodOfSendView
	}
}
