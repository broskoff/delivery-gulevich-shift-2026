import UIKit

final class CitySelectionViewController: UIViewController {
	
	let citySelectionContentView: UIView & CitySelectionContentViewProtocol
	let presenter: ICitySelectionPresenter
	
	init(
		citySelectionContentView:  UIView & CitySelectionContentViewProtocol,
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
		
		citySelectionContentView.delegate = self
	}
}

extension CitySelectionViewController: CitySelectionContentViewDelegateProtocol {
	func didSelectCity(_ city: String) {
		presenter.didSelectCity(city)
	}
}
