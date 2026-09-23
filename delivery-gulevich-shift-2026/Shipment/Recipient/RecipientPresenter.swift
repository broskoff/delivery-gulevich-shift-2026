protocol RecipientPresenterProtocol: AnyObject {
	func userEnteredRecipientData(surname: String, name: String, patronymic: String, phone: String)
}

final class RecipientPresenter: RecipientPresenterProtocol {
	
	weak var output: ShipmentOutputProtocol?
	weak var view: RecipientViewControllerProtocol?
	
	init(output: ShipmentOutputProtocol) {
		self.output = output
	}
	
	func userEnteredRecipientData(surname: String, name: String, patronymic: String, phone: String) {
		output?.openSender(surname, name, patronymic, phone)
	}
}


