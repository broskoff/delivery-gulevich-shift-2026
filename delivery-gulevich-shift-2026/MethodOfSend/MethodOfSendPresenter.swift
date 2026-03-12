import Foundation
import UIKit

//переименовать userDidFinish() когда появится конкретное действие
protocol IMethodOfSendPresenterOutput: AnyObject {
	func userDidFinish()
}

//переименовать userActed() когда появится конкретное действие
protocol IMethodOfSendPresenter: AnyObject {
	func userActed()
}

class MethodOfSendPresenter: IMethodOfSendPresenter {
	
	weak var output: IMethodOfSendPresenterOutput?
	weak var view: IMethodOfSendViewController?
	
	init(output: IMethodOfSendPresenterOutput) {
		self.output = output
	}
	
	func userActed() {
		output?.userDidFinish()
	}
}
