import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var appCoordinator: CoordinatorProtocol?
	
	func scene(_ scene: UIScene,
			   willConnectTo session: UISceneSession,
			   options connectionOptions: UIScene.ConnectionOptions) {
		
		guard let windowScene = (scene as? UIWindowScene) else { return }
		
		let window = UIWindow(windowScene: windowScene)
		
		let appContainer = AppContainer(window: window)
		appCoordinator = AppCoordinator(window: window, appContainer: appContainer)
		appCoordinator?.start()
	}
}

//для теста
//class SceneDelegate: UIResponder, UIWindowSceneDelegate {
//
//	var window: UIWindow?
//	
//	func scene(_ scene: UIScene,
//			   willConnectTo session: UISceneSession,
//			   options connectionOptions: UIScene.ConnectionOptions) {
//		
//		guard let windowScene = (scene as? UIWindowScene) else { return }
//		window = UIWindow(windowScene: windowScene)
//
//		let vc = RecepientViewController()
//		window?.rootViewController = vc
//		window?.makeKeyAndVisible()
//	}
//}
