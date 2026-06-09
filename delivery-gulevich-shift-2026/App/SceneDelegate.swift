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


/*
 
 Закоммитить AppContainer and ThemeService
 Разделить MainAssembly на Calculation, History, Profile. Возможно сделать фабрику и ассембли
 Создать в ProfileView сегментКонтрол с выбором темы и реализовать нажатие кнопок и смену темы приложения.
 
 */
