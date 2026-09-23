import UIKit

protocol DataValidationViewControllerProtocol: AnyObject {
	func updateView()
}

final class DataValidationViewController: UIViewController {
	
	var dataValidationContentView: UIView & DataValidationContentViewProtocol
	var presenter: DataValidationPresenterProtocol
	
	init(dataValidationContentView: UIView & DataValidationContentViewProtocol,
		 presenter: DataValidationPresenterProtocol) {
		self.dataValidationContentView = dataValidationContentView
		self.presenter = presenter
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = dataValidationContentView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
}

extension DataValidationViewController: DataValidationViewControllerProtocol {
	func updateView() {
		
	}
}
