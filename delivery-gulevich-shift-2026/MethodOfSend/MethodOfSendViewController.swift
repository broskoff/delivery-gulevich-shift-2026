import UIKit
import SnapKit

protocol IMethodOfSendViewController: AnyObject {
	func updateView()
}

class MethodOfSendViewController: UIViewController, IMethodOfSendViewDelegate {
	
	let methodOfSendContentView: UIView & IMethodOfSendContentView
	let presenter: IMethodOfSendPresenter
	
	init(
		methodOfSendContentView: UIView & IMethodOfSendContentView,
		presenter: IMethodOfSendPresenter
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
		
		title = "Способ отправки"
		methodOfSendContentView.delegate = self
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		
		presenter.didFinish()
	}
	
	//TODO: переход на экран заполнения данных получателя
	func didTapDeliveryToTheDoor() {
		print("Нажали Экспресс доставка до двери")
	}
}

extension MethodOfSendViewController: IMethodOfSendViewController {
	func updateView() {
		
	}
}
