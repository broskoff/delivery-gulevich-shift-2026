import UIKit

final class AppContainer {
	let themeService: ThemeServiceProtocol
	
	init(window: UIWindow) {
		self.themeService = ThemeService(window: window)
	}
}
