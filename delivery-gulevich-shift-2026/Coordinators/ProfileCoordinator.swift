import UIKit

final class ProfileCoordinator: CoordinatorProtocol {
	
	let navigationController: UINavigationController
	let assembly: ProfileAssemblyProtocol
	
	init(navigationController: UINavigationController, assembly: ProfileAssemblyProtocol) {
		self.navigationController = navigationController
		self.assembly = assembly
	}
	
	func start() {
		let profileViewController = assembly.build(output: self)
		navigationController.viewControllers = [profileViewController]
		navigationController.tabBarItem = UITabBarItem(
			title: UIConstants.TabBarItem.Title.profile,
			image: UIImage(systemName: UIConstants.TabBarItem.Image.profile),
			selectedImage: nil
		)
	}
}

extension ProfileCoordinator: IProfilePresenterOutput {
	
}
