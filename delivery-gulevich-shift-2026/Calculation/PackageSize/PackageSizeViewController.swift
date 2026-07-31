import UIKit

class PackageSizeViewController: UIViewController {
	
	private let packageSizeContentView = PackageSizeContentView()
	
	var onSizeSelected: ((PackageSizeItem) -> ())?
	
	override func loadView() {
		self.view = packageSizeContentView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		packageSizeContentView.delegate = self
	}
}

extension PackageSizeViewController: PackageSizeContentViewDelegateProtocol {
	func didSelectedSizePackage(_ size: PackageSizeItem) {
		onSizeSelected?(size)
		dismiss(animated: true)
	}
}
