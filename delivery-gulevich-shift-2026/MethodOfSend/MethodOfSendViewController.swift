import UIKit
import SnapKit

class MethodOfSendViewController: UIViewController, IMethodOfSendViewDelegate {
	
	let methodOfSendView: MethodOfSendView
	let presenter: IMethodOfSendPresenter
	
	init(
		methodOfSendView: MethodOfSendView,
		presenter: IMethodOfSendPresenter
	) {
		self.methodOfSendView = methodOfSendView
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		
		title = "Способ отправки"
		self.view = methodOfSendView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		methodOfSendView.delegate = self
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
