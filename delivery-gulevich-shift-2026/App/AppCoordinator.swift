import UIKit

final class AppCoordinator: CoordinatorProtocol {
	
	private let window: UIWindow
	private let mainCoordinator: MainCoordinator
	
	init(window: UIWindow, appContainer: AppContainer) {
		self.window = window
		
		self.mainCoordinator = MainCoordinator(
			calculationAssembly: CalculationAssembly(),
			historyAssembly: HistoryAssembly(),
			profileAssembly: ProfileAssembly(themeService: appContainer.themeService)
		)
	}
	
	func start() {
		mainCoordinator.start()
		
		window.rootViewController = mainCoordinator.tabBarController
		window.makeKeyAndVisible()
	}
}
