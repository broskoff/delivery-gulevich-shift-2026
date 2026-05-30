import UIKit

final class AppCoordinator: CoordinatorProtocol {
	
	private var window: UIWindow
	private let mainCoordinator = MainCoordinator()
	
	init(window: UIWindow) {
		self.window = window
	}
	
	func start() {
		mainCoordinator.start()
		
		window.rootViewController = mainCoordinator.tabBarController
//
//		let vc = TestViewController()
//		window.rootViewController = vc
		window.makeKeyAndVisible()
	}
}
