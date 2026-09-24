protocol DataValidationPresenterProtocol: AnyObject {
//	func userChoisePayment()
}

final class DataValidationPresenter: DataValidationPresenterProtocol {
	private let data: DataToDelivery
	
	weak var view: DataValidationViewControllerProtocol?
	weak var output: ShipmentOutputProtocol?
	
	
	init(output: ShipmentOutputProtocol?, data: DataToDelivery) {
		self.output = output
		self.data = data
	}
	
//	func userChoisePayment() {
//		self.output?.openDataValidation()
//	}
}
