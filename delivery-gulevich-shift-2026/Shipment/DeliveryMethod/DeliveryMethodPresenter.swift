protocol DeliveryMethodPresenterProtocol: AnyObject {
	func userChoseDeliveryMethod(type: String, price: String, days: String)
}

class DeliveryMethodPresenter: DeliveryMethodPresenterProtocol {
	
	weak var output: ShipmentOutputProtocol?
	weak var view: DeliveryMethodViewControllerProtocol?
	
	init(output: ShipmentOutputProtocol) {
		self.output = output
	}
	
	func userChoseDeliveryMethod(type: String, price: String, days: String) {
		output?.openRecipient(type, price, days)
	}
}
