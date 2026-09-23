protocol DataValidationPresenterProtocol: AnyObject {
//	func userChoisePayment()
}

final class DataValidationPresenter: DataValidationPresenterProtocol {
	private let dataToDelivery: DataToDelivery
	
	weak var view: DataValidationViewControllerProtocol?
	weak var output: ShipmentOutputProtocol?
	
	
	init(output: ShipmentOutputProtocol?, dataToDelivery: DataToDelivery) {
		self.output = output
		self.dataToDelivery = dataToDelivery
	}
	
//	func userChoisePayment() {
//		self.output?.openDataValidation()
//	}
}
