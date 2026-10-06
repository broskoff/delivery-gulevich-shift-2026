protocol PaymentDeliveryPresenterProtocol: AnyObject {
	func userChoisePayment(_ payer: String)
}

final class PaymentDeliveryPresenter: PaymentDeliveryPresenterProtocol {
	
	weak var view: PaymentDeliveryViewControllerProtocol?
	weak var output: ShipmentOutputProtocol?
	
	init(output: ShipmentOutputProtocol?) {
		self.output = output
	}
	
	func userChoisePayment(_ payer: String) {
		self.output?.openDataValidation(payer)
	}
}
