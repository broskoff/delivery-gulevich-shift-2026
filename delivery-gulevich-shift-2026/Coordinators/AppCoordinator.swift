import UIKit

final class AppCoordinator: IAppCoordinator {
	
	var window: UIWindow
	private let mainCoordinator = MainCoordinator()
	
	init(scene: UIWindowScene) {
		window = UIWindow(windowScene: scene)
	}
	
	func start() {
		let tabBarController = mainCoordinator.start()
		
		window.rootViewController = tabBarController
		window.makeKeyAndVisible()
	}
}
