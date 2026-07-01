import UIKit
//навигацию назад не забудь

final class CitySelectionCoordinator: CoordinatorProtocol {
	
	var onCitySelected: ((String) -> ())?
	
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
		print("parent: \(String(describing: parentCoordinator))")
		navigationController.pushViewController(citySelectionViewController, animated: true)
	}
	
	deinit {
		print("CitySelectionCoordinator deinit")
	}
}

extension CitySelectionCoordinator: ICitySelectionPresenterOutput {
	
	func didSelectCity(_ city: String) {
		onCitySelected?(city)
		
		navigationController.popViewController(animated: true)
		
		parentCoordinator?.childDidFinish(child: self)
	}
}
