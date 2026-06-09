import UIKit

protocol ProfileAssemblyProtocol: AnyObject {
	func build(output: IProfilePresenterOutput) -> UIViewController
}

final class ProfileAssembly: ProfileAssemblyProtocol {
	
	let themeService: ThemeServiceProtocol
	
	init(themeService: ThemeServiceProtocol) {
		self.themeService = themeService
	}
	
	func build(output: any IProfilePresenterOutput) -> UIViewController {
		let profilePresenter = ProfilePresenter(output: output, themeService: themeService)
		let profileContentView = ProfileContentView()
		let profileView = ProfileViewController(
			profileContentView: profileContentView,
			profilePresenter: profilePresenter
		)
		
		profilePresenter.view = profileView
		return profileView
	}
}
