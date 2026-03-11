import Foundation
import UIKit

protocol IMethodOfSendPresenterOutput: AnyObject {
	func userDidFinish()
}

protocol IMethodOfSendPresenter: AnyObject {
	func didFinish()
}

class MethodOfSendPresenter: IMethodOfSendPresenter {
	
	weak var output: IMethodOfSendPresenterOutput?
	weak var view: IMethodOfSendViewController?
	
	init(output: IMethodOfSendPresenterOutput) {
		self.output = output
	}
	
	func didFinish() {
		output?.userDidFinish()
	}
}
