import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	
	var window: UIWindow?
	var coordinator: MainCoordinator?
	
	func scene(_ scene: UIScene,
			   willConnectTo session: UISceneSession,
			   options connectionOptions: UIScene.ConnectionOptions) {
		
		guard let scene = (scene as? UIWindowScene) else { return }
		
		window = UIWindow(windowScene: scene)
		
		let tabBarController = UITabBarController()
		
		coordinator = MainCoordinator(tabBarController: tabBarController)
		
		window?.rootViewController = tabBarController
		window?.makeKeyAndVisible()
		
		coordinator?.start()
	}
}

