import UIKit

final class CalculationCoordinator: NSObject, CoordinatorProtocol {
	
	let navigationController: UINavigationController
	let assembly: CalculationAssemblyProtocol
	
	var childCoordinators: [CoordinatorProtocol] = []
	
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
		navigationController.viewControllers = [calculationViewController]
		navigationController.tabBarItem = UITabBarItem(
			title: UIConstants.TabBarItem.Title.calculation,
			image: UIImage(systemName: UIConstants.TabBarItem.Image.calculation),
			selectedImage: nil
		)
	}
}

extension CalculationCoordinator: ICalculationPresenterOutput {
	
	func showShipment() {
		let shipmentCoordinator = ShipmentCoordinator(
			parentCoordinator: self,
			navigationController: navigationController
		)
		
		childCoordinators.append(shipmentCoordinator)
		shipmentCoordinator.start()
	}
	
	func showCitySelection(onSelect: @escaping (String) -> ()) {
		let citySelectionCoordinator = CitySelectionCoordinator(
			parentCoordinator: self,
			navigationController: navigationController
		)
		//MARK: callback.
		//В свойство onCitySelected координатора citySelectionCoordinator устанавливается сбегающий клоужер и остается в памяти, В свойстве onCitySelected из CalculationPresenter лежит действие self?.view?.updateDepartureCity(city). Свойство onCitySelected вызовется в методе didSelectCity координатора citySelectionCoordinator
		citySelectionCoordinator.onCitySelected = onSelect
		
		childCoordinators.append(citySelectionCoordinator)
		citySelectionCoordinator.start()
	}
	
	func showPackageSize(onSelect: @escaping (PackageSizeItem) -> ()) {
		let packageSize = PackageSizeViewController()
		packageSize.onSizeSelected = onSelect
		
		let sheet = packageSize.sheetPresentationController
		sheet?.detents = [.medium()]
		
		packageSize.modalPresentationStyle = .pageSheet
		
		navigationController.present(packageSize, animated: true)
	}
	
	func childDidFinish(child: CoordinatorProtocol) {
		childCoordinators.removeAll { $0 === child }
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
			case is DeliveryMethodViewController:
				childCoordinators.removeAll { $0 is ShipmentCoordinator }
			case is CitySelectionViewController:
				childCoordinators.removeAll { $0 is CitySelectionCoordinator }
			default: break
			}
		}
	}
}
