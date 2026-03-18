import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var appCoordinator: IAppCoordinator?
	
	func scene(_ scene: UIScene,
			   willConnectTo session: UISceneSession,
			   options connectionOptions: UIScene.ConnectionOptions) {
		
		guard let scene = (scene as? UIWindowScene) else { return }
		
		appCoordinator = AppCoordinator(scene: scene)
		appCoordinator?.start()
	}
}
