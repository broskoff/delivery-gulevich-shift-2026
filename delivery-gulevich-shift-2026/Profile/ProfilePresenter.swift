protocol IProfilePresenterOutput: AnyObject {
	
}

protocol IProfilePresenter: AnyObject {
	
}

final class ProfilePresenter: IProfilePresenter {
	
	weak var output: IProfilePresenterOutput?
	weak var view: IProfileView?
	
	init(output: IProfilePresenterOutput) {
		self.output = output
	}
}
