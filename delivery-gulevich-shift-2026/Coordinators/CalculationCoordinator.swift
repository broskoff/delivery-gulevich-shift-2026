import UIKit

final class CalculationCoordinator: NSObject, ICoordinator {
	
	let navigationController: UINavigationController
	let assembly: IMainAssembly
	
	var childCoordinators: [MethodOfSendCoordinator] = []
	
	init(navigationController: UINavigationController, assembly: IMainAssembly) {
		self.navigationController = navigationController
		self.assembly = assembly
	}
	
	func start() {
		navigationController.delegate = self
		let calculationViewController = assembly.buildCalculationScreen(output: self)
		navigationController.viewControllers = [calculationViewController]
		navigationController.tabBarItem = UITabBarItem(title: "Расчет",
													   image: UIImage(systemName: "plus.forwardslash.minus"),
													   selectedImage: nil)
	}
}

extension CalculationCoordinator: ICalculationPresenterOutput {
	
	func showMethodOfSend() {
		let coordinator = MethodOfSendCoordinator(
			parentCoordinator: self,
			navigationController: navigationController
		)
		
		childCoordinators.append(coordinator)
		coordinator.start()
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
			//тут проблема, что если в массиве будет больше координаторов, придется находить нужный среди всех
			childDidFinish(child: childCoordinators.first)
		}
	}
}
