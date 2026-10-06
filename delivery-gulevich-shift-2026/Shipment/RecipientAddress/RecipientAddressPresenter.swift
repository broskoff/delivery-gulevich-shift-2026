protocol RecipientAddressPresenterProtocol: AnyObject {
	func userEnteredAddress(_ street: String, _ house: String, _ apartment: String, _ note: String, _ leaveAtTheDoor: Bool)
}

final class RecipientAddressPresenter: RecipientAddressPresenterProtocol {
	
	weak var view: RecipientAddressViewControllerProtocol?
	weak var output: ShipmentOutputProtocol?
	
	init(output: ShipmentOutputProtocol?) {
		self.output = output
	}
	
	func userEnteredAddress(_ street: String,
							_ house: String,
							_ apartment: String,
							_ note: String,
							_ leaveAtTheDoor: Bool) {
		self.output?.openPaymentDelivery(street, house, apartment, note, leaveAtTheDoor)
	}
}
