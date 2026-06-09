protocol IProfilePresenterOutput: AnyObject {
	
}

protocol IProfilePresenter: AnyObject {
	func userChoiceSegment(index: Int)
}

final class ProfilePresenter: IProfilePresenter {
	
	weak var output: IProfilePresenterOutput?
	weak var view: IProfileView?
	private let themeService: ThemeServiceProtocol
	
	init(output: IProfilePresenterOutput, themeService: ThemeServiceProtocol) {
		self.output = output
		self.themeService = themeService
	}
	
	func userChoiceSegment(index: Int) {
		guard let theme = AppTheme(rawValue: index) else { return }
		
		themeService.apply(theme: theme)
	}
}
