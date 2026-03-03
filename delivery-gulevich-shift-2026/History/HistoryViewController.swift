import UIKit

protocol IHistoryView: AnyObject {
	
	func updateView()
}

final class HistoryViewController: UIViewController {
	
	let historyContentView: IHistoryContentView & UIView
	let presenter: IHistoryPresenter
	
	init(
		historyContentView: IHistoryContentView & UIView,
		presenter: IHistoryPresenter
	) {
		self.historyContentView = historyContentView
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		self.view = historyContentView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "История"
	}
}

extension HistoryViewController: IHistoryView {
	
	func updateView() {
		
	}
}
