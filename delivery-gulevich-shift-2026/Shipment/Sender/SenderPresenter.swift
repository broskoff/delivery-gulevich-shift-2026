protocol SenderPresenterProtocol: AnyObject {
	func userEnteredSenderData(_ surname: String, _ name: String, _ patronymic: String, _ phone: String)
}

final class SenderPresenter: SenderPresenterProtocol {
	
	weak var output: ShipmentOutputProtocol?
	weak var view: SenderViewControllerProtocol?
	
	init(output: ShipmentOutputProtocol) {
		self.output = output
	}
	
	func userEnteredSenderData(_ surname: String, _ name: String, _ patronymic: String, _ phone: String) {
		output?.openSenderAddress(surname, name, patronymic, phone)
	}
}
