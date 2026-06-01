import UIKit
//навигацию назад не забудь

final class CitySelectionCoordinator: CoordinatorProtocol {
	
	weak var parentCoordinator: CalculationCoordinator?
	let citySelectionAssembly = CitySelectionAssembly()
	var navigationController: UINavigationController
	
	init(parentCoordinator: CalculationCoordinator?,
		 navigationController: UINavigationController) {
		self.parentCoordinator = parentCoordinator
		self.navigationController = navigationController
	}
	
	func start() {
		
		let citySelectionViewController = citySelectionAssembly.createScreen(output: self)
		print("parent: \(parentCoordinator)")
		navigationController.pushViewController(citySelectionViewController, animated: true)
	}
	
	deinit {
		print("CitySelectionCoordinator deinit")
	}
}

extension CitySelectionCoordinator: ICitySelectionPresenterOutput {
	//переименовать userDidFinish() когда появится конкретное действие
	func userDidFinish() {
		parentCoordinator?.childDidFinish(child: self)
	}
}
