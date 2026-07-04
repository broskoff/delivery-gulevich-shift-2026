import UIKit
import SnapKit

protocol DeliveryMethodViewControllerProtocol: AnyObject {
	func updateView()
}

class DeliveryMethodViewController: UIViewController, DeliveryMethodViewDelegateProtocol {
	
	let deliveryMethodContentView: UIView & DeliveryMethodContentViewProtocol
	let presenter: DeliveryMethodPresenterProtocol
	
	init(
		deliveryMethodContentView: UIView & DeliveryMethodContentViewProtocol,
		presenter: DeliveryMethodPresenterProtocol
	) {
		self.deliveryMethodContentView = deliveryMethodContentView
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		self.view = deliveryMethodContentView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		deliveryMethodContentView.delegate = self
	}
	
	//TODO: переход на экран заполнения данных получателя
	func didTapDeliveryToTheDoor() {
		print("Нажали Экспресс доставка до двери")
	}
}

extension DeliveryMethodViewController: DeliveryMethodViewControllerProtocol {
	func updateView() {
		
	}
}
