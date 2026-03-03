protocol IProfilePresenter: AnyObject {
	
}

final class ProfilePresenter: IProfilePresenter {
	
	weak var coordinator: IMainCoordinator?
	weak var view: IProfileView?
	
	init(coordinator: IMainCoordinator?) {
		self.coordinator = coordinator
	}
}
