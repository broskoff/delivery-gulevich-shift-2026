import UIKit

final class HistoryViewController: UIViewController {
	
	let historyView: HistoryView
	let presenter: IHistoryPresenter
	
	init(
		historyView: HistoryView,
		presenter: IHistoryPresenter
	) {
		self.historyView = historyView
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		self.view = historyView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "История"
	}
}
