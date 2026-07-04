import Foundation
import UIKit

//переименовать userDidFinish() когда появится конкретное действие
protocol DeliveryMethodPresenterOutputProtocol: AnyObject {
	func userDidFinish()
}

//переименовать userActed() когда появится конкретное действие
protocol DeliveryMethodPresenterProtocol: AnyObject {
	func userActed()
}

class DeliveryMethodPresenter: DeliveryMethodPresenterProtocol {
	
	weak var output: DeliveryMethodPresenterOutputProtocol?
	weak var view: DeliveryMethodViewControllerProtocol?
	
	init(output: DeliveryMethodPresenterOutputProtocol) {
		self.output = output
	}
	
	func userActed() {
		output?.userDidFinish()
	}
}
