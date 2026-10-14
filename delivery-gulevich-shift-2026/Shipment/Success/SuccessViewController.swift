import UIKit

protocol SuccessViewProtocol: AnyObject {
	
}

final class SuccessViewController: UIViewController {
	
	private let successContentView: UIView & SuccessContentViewProtocol
	private let presenter: SuccessPresenterProtocol
	
	init(
		successContentView: UIView & SuccessContentViewProtocol,
		presenter: SuccessPresenterProtocol
	) {
		self.successContentView = successContentView
		self.presenter = presenter
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = successContentView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		userDidTapCheckStatus()
	}
}

extension SuccessViewController: SuccessViewProtocol {
	
	private func userDidTapCheckStatus() {
		presenter.userDidTapCheckStatus()
	}
}
