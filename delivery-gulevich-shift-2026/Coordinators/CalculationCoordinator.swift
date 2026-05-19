import UIKit

final class CalculationCoordinator: NSObject, ICoordinator {
	
	let navigationController: UINavigationController
	let assembly: IMainAssembly
	
	var childCoordinators: [ICoordinator] = []
	
	init(navigationController: UINavigationController, assembly: IMainAssembly) {
		self.navigationController = navigationController
		self.assembly = assembly
	}
	
	func start() {
		navigationController.delegate = self
		let calculationViewController = assembly.buildCalculationScreen(output: self)
		navigationController.viewControllers = [calculationViewController]
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
		methodOfSendCoordinator.start()
	}
	
	func showCitySelection() {
		let citySelectionCoordinator = CitySelectionCoordinator(
			parentCoordinator: self,
			navigationController: navigationController
		)
		
		childCoordinators.append(citySelectionCoordinator)
		citySelectionCoordinator.start()
	}
	
	func showPackageSize() {
		let packageSize = PackageSizeViewController()
		
		let sheet = packageSize.sheetPresentationController
		sheet?.detents = [.medium()]
		
		packageSize.modalPresentationStyle = .pageSheet
		
		navigationController.present(packageSize, animated: true)
	}
	
	func childDidFinish(child: MethodOfSendCoordinator?) {
		for (index, coordinator) in childCoordinators.enumerated() {
			if coordinator === child {
				childCoordinators.remove(at: index)
				break
			}
		}
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
			//тут проблема, что если в массиве будет больше координаторов, придется находить нужный среди всех! Уйти бы от кастинга
			childDidFinish(child: childCoordinators.first as? MethodOfSendCoordinator)
		}
	}
}
