protocol SenderAddressPresenterProtocol: AnyObject {
	func userEnteredAddress(_ street: String, _ house: String, _ apartment: String, _ note: String)
}

final class SenderAddressPresenter: SenderAddressPresenterProtocol {
	
	weak var view: SenderAddressViewProtocol?
	weak var output: ShipmentOutputProtocol?
	
	init(output: ShipmentOutputProtocol) {
		self.output = output
	}
	
	func userEnteredAddress(_ street: String, _ house: String, _ apartment: String, _ note: String) {
//		output.openRecipientAddress()
	}
}
