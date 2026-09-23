import UIKit

final class AppCoordinator: CoordinatorProtocol {
	
	private let window: UIWindow
	private let tabBarCoordinator: TabBarCoordinator
	
	init(window: UIWindow, appContainer: AppContainer) {
		self.window = window
		
		self.tabBarCoordinator = TabBarCoordinator(
			calculationAssembly: CalculationAssembly(),
			historyAssembly: HistoryAssembly(),
			profileAssembly: ProfileAssembly(themeService: appContainer.themeService)
		)
	}
	
	func start() {
		tabBarCoordinator.start()
		
		window.rootViewController = tabBarCoordinator.tabBarController
		window.makeKeyAndVisible()
	}
}
