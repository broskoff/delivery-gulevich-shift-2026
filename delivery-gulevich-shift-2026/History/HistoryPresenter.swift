protocol IHistoryPresenterOutput: AnyObject {
	
}

protocol IHistoryPresenter: AnyObject {
	
}

final class HistoryPresenter: IHistoryPresenter {
	
	weak var output: IHistoryPresenterOutput?
	weak var view: IHistoryView?
	
	init(output: IHistoryPresenterOutput) {
		self.output = output
	}
}
