import UIKit

class CalculationViewController: UIViewController {
	
	private let calculationView = CalculationView()
	
	override func loadView() {
		view = calculationView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Мы доставим ваш заказ"
	}
}


