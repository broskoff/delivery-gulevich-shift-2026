import UIKit

protocol ICitySelectionViewController: AnyObject {
	func updateView()
}

final class CitySelectionViewController: UIViewController {
	
	let citySelectionContentView: UIView & ICitySelectionContentView
	let presenter: ICitySelectionPresenter
	
	init(
		citySelectionContentView:  UIView & ICitySelectionContentView,
		presenter: ICitySelectionPresenter
	) {
		self.citySelectionContentView = citySelectionContentView
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		self.view = citySelectionContentView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
}

extension CitySelectionViewController: ICitySelectionViewController {
	func updateView() {
		
	}
}
