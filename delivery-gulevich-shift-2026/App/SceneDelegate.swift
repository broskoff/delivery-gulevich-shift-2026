import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var coordinator: IAppCoordinator?
	
	func scene(_ scene: UIScene,
			   willConnectTo session: UISceneSession,
			   options connectionOptions: UIScene.ConnectionOptions) {
		
		guard let scene = (scene as? UIWindowScene) else { return }
		
		coordinator = AppCoordinator(scene: scene)
		coordinator?.start()
	}
}
