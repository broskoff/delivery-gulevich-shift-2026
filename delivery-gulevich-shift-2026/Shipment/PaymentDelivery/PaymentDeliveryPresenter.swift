protocol PaymentDeliveryPresenterProtocol: AnyObject {
	func userChoisePayment()
}

final class PaymentDeliveryPresenter: PaymentDeliveryPresenterProtocol {
	
	weak var view: PaymentDeliveryViewControllerProtocol?
	weak var output: ShipmentOutputProtocol?
	
	init(output: ShipmentOutputProtocol?) {
		self.output = output
	}
	
	func userChoisePayment() {
		self.output?.openDataValidation()
	}
}
