import UIKit

final class ProfileCoordinator: ICoordinator {
	
	let navigationController: UINavigationController
	let assembly: IMainAssembly
	
	init(navigationController: UINavigationController, assembly: IMainAssembly) {
		self.navigationController = navigationController
		self.assembly = assembly
	}
	
	func start() {
		let profileViewController = assembly.buildProfileScreen(output: self)
		navigationController.viewControllers = [profileViewController]
		navigationController.tabBarItem = UITabBarItem(
			title: UIConstants.TabBarItem.title.profile,
			image: UIImage(systemName: UIConstants.TabBarItem.image.profile),
			selectedImage: nil
		)
	}
}

extension ProfileCoordinator: IProfilePresenterOutput {
	
}
