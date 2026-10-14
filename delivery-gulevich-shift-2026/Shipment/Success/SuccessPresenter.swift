protocol SuccessPresenterProtocol: AnyObject {
	func userDidTapCheckStatus()
}

final class SuccessPresenter: SuccessPresenterProtocol {
	
	weak var view: SuccessViewProtocol?
	weak var output: ShipmentOutputProtocol?
	
	init(output: ShipmentOutputProtocol) {
		self.output = output
	}
	
	func userDidTapCheckStatus() {
		print("далее будет переход на Вход или Историю отправлений")
	}
}
