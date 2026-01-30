import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let scene = (scene as? UIWindowScene) else { return }
		
		window = UIWindow(windowScene: scene)
		
		let tabBarController = UITabBarController()
		
		let profileViewController = ProfileViewController()
		let profileNavigationController = UINavigationController(rootViewController: profileViewController)
		profileNavigationController.tabBarItem = UITabBarItem(title: "Профиль",
															  image: UIImage(systemName: "person.crop.circle"),
															  selectedImage: nil)
		
		let historyViewController = HistoryViewController()
		let historyNavigationController = UINavigationController(rootViewController: historyViewController)
		historyNavigationController.tabBarItem = UITabBarItem(title: "История",
															  image: UIImage(systemName: "clock"),
															  selectedImage: nil)
		
		let calculationViewController = CalculationViewController()
		let calculationNavigationController = UINavigationController(rootViewController: calculationViewController)
		calculationNavigationController.tabBarItem = UITabBarItem(title: "Расчет",
																  image: UIImage(systemName: "plus.forwardslash.minus"),
																  selectedImage: nil)
		
		tabBarController.viewControllers = [
			calculationNavigationController,
			historyNavigationController,
			profileNavigationController
		]
		
		window?.rootViewController = tabBarController
		window?.makeKeyAndVisible()
	}
}

