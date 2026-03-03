protocol IHistoryPresenter: AnyObject {
	
}

final class HistoryPresenter: IHistoryPresenter {
	
	weak var coordinator: IMainCoordinator?
	weak var view: IHistoryView?
	
	init(coordinator: IMainCoordinator) {
		self.coordinator = coordinator
	}
}
