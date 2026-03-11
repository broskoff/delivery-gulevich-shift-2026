import UIKit

final class CalculationCoordinator: ICoordinator {
	
	let navigationController: UINavigationController
	let assembly = MainAssembly()
	
	var childCoordinators: [MethodOfSendCoordinator] = []
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
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
