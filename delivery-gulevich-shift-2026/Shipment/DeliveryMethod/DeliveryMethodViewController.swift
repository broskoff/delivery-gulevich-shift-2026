import UIKit
import SnapKit

protocol DeliveryMethodViewControllerProtocol: AnyObject {
	func updateView()
}

class DeliveryMethodViewController: UIViewController, DeliveryMethodViewDelegateProtocol {
	
	let methodOfSendContentView: UIView & DeliveryMethodContentViewProtocol
	let presenter: DeliveryMethodPresenterProtocol
	
	init(
		methodOfSendContentView: UIView & DeliveryMethodContentViewProtocol,
		presenter: DeliveryMethodPresenterProtocol
	) {
		self.methodOfSendContentView = methodOfSendContentView
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		self.view = methodOfSendContentView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		methodOfSendContentView.delegate = self
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
