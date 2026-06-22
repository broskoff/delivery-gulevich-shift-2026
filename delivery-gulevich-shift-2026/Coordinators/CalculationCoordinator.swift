import UIKit

protocol CalculationPresenterInputProtocol: AnyObject {
	func didSelectedDepartureCity(_ city: String)
}

final class CalculationCoordinator: NSObject, CoordinatorProtocol {
	
	let navigationController: UINavigationController
	let assembly: CalculationAssemblyProtocol
	
	var childCoordinators: [CoordinatorProtocol] = []
	weak var presenterInput: CalculationPresenterInputProtocol?
	
	init(
		navigationController: UINavigationController,
		assembly: CalculationAssemblyProtocol
	) {
		self.navigationController = navigationController
		self.assembly = assembly
	}
	
	func start() {
		showScreen()
	}
	
	private func showScreen() {
		navigationController.delegate = self
		let calculationViewController = assembly.build(output: self)
		self.presenterInput = calculationViewController.presenterInput
		navigationController.viewControllers = [calculationViewController.view]
		navigationController.tabBarItem = UITabBarItem(
			title: UIConstants.TabBarItem.Title.calculation,
			image: UIImage(systemName: UIConstants.TabBarItem.Image.calculation),
			selectedImage: nil
		)
	}
}

extension CalculationCoordinator: ICalculationPresenterOutput {
	
	func showMethodOfSend() {
		let methodOfSendCoordinator = MethodOfSendCoordinator(
			parentCoordinator: self,
			navigationController: navigationController
		)
		
		childCoordinators.append(methodOfSendCoordinator)
		print(childCoordinators)
		methodOfSendCoordinator.start()
	}
	
	func showCitySelection() {
		let citySelectionCoordinator = CitySelectionCoordinator(
			parentCoordinator: self,
			navigationController: navigationController
		)
		//MARK: callback
		citySelectionCoordinator.onCitySelected = { [weak self] city in
			self?.citySelected(city)
		}
		
		childCoordinators.append(citySelectionCoordinator)
		print(childCoordinators)
		citySelectionCoordinator.start()
	}
	
	private func citySelected(_ city: String) {
		presenterInput?.didSelectedDepartureCity(city)
	}
	
	func showPackageSize() {
		let packageSize = PackageSizeViewController()
		
		let sheet = packageSize.sheetPresentationController
		sheet?.detents = [.medium()]
		
		packageSize.modalPresentationStyle = .pageSheet
		
		navigationController.present(packageSize, animated: true)
	}
	
	func childDidFinish(child: CoordinatorProtocol) {
		childCoordinators.removeAll { $0 === child }
		print("принт из метода childDidFinish в CalculationCoordinator: \(childCoordinators)")
	}
}

extension CalculationCoordinator: UINavigationControllerDelegate {
	
	func navigationController(_ navigationController: UINavigationController,
							  didShow viewController: UIViewController,
							  animated: Bool) {
		
		guard let fromVC = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
		
		if navigationController.viewControllers.contains(fromVC) {
			return
		} else {
			switch fromVC {
			case is MethodOfSendViewController:
				childCoordinators.removeAll { $0 is MethodOfSendCoordinator }
			case is CitySelectionViewController:
				childCoordinators.removeAll { $0 is CitySelectionCoordinator }
			default: break
			}
		}
	}
}
