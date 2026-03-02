import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	
	var window: UIWindow?
	var coordinator: IMainCoordinator?
	
	func scene(_ scene: UIScene,
			   willConnectTo session: UISceneSession,
			   options connectionOptions: UIScene.ConnectionOptions) {
		
		guard let scene = (scene as? UIWindowScene) else { return }
		
		window = UIWindow(windowScene: scene)
		
		let tabBarController = UITabBarController()
		let mainAssembly = MainAssembly()
		
		coordinator = MainCoordinator(
			assembly: mainAssembly,
			tabBarController: tabBarController
		)
		
		window?.rootViewController = tabBarController
		window?.makeKeyAndVisible()
		
		coordinator?.start()
	}
}

