import UIKit

protocol HistoryAssemblyProtocol: AnyObject {
	func build(output: IHistoryPresenterOutput) -> UIViewController
}

final class HistoryAssembly: HistoryAssemblyProtocol {
	func build(output: any IHistoryPresenterOutput) -> UIViewController {
		let historyPresenter = HistoryPresenter(output: output)
		let historyContentView = HistoryContentView()
		let historyView = HistoryViewController(
			historyContentView: historyContentView,
			presenter: historyPresenter
		)
		
		historyPresenter.view = historyView
		return historyView
	}
}
