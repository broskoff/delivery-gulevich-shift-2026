protocol IProfilePresenter: AnyObject {
	
}

final class ProfilePresenter: IProfilePresenter {
	
	weak var coordinator: IMainCoordinator?
	
	init(coordinator: IMainCoordinator?) {
		self.coordinator = coordinator
	}
}
