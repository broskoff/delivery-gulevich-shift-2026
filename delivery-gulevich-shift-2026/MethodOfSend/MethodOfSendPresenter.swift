import Foundation
import UIKit

protocol IMethodOfSendPresenter: AnyObject {
	func didFinish()
}

class MethodOfSendPresenter: IMethodOfSendPresenter {
	
	weak var coordinator: IMethodOfSendCoordinator?
	weak var view: IMethodOfSendViewController?
	
	init(coordinator: IMethodOfSendCoordinator) {
		self.coordinator = coordinator
	}
	
	func didFinish() {
		coordinator?.didFinish()
	}
}
