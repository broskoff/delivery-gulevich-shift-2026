import UIKit

class CalculationViewController: UIViewController, ICoordinating {
	
	var coordinator: ICoordinator?
	
	private let calculationView = CalculationView()
	
	override func loadView() {
		view = calculationView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
}




