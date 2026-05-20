import UIKit

final class AppCoordinator: IAppCoordinator {
	
	var window: UIWindow
	private let mainCoordinator = MainCoordinator()
	
	init(scene: UIWindowScene) {
		window = UIWindow(windowScene: scene)
	}
	
	func start() {
		mainCoordinator.start()
		
		window.rootViewController = mainCoordinator.tabBarController
//		let vc = TestViewController()
//		window.rootViewController = vc
		window.makeKeyAndVisible()
	}
}
