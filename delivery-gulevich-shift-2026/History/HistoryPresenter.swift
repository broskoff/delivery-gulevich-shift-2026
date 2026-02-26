protocol IHistoryPresenter: AnyObject {
	
}

final class HistoryPresenter: IHistoryPresenter {
	
	weak var coordinator: IMainCoordinator?
	
	init(coordinator: IMainCoordinator) {
		self.coordinator = coordinator
	}
}
