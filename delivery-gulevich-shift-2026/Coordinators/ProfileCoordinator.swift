import UIKit

final class ProfileCoordinator: ICoordinator {
	
	var navigationController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		let assembly = MainAssembly()
		let profileViewController = assembly.buildProfileScreen(coordinator: self)
		navigationController.viewControllers = [profileViewController]
		navigationController.tabBarItem = UITabBarItem(title: "Профиль",
															  image: UIImage(systemName: "person.crop.circle"),
															  selectedImage: nil)
	}
}
