import UIKit

class PackageSizeViewController: UIViewController {
	
	private let packageSizeContentView = PackageSizeContentView()
	
//	private let packageSizeContentView: IPackageSizeContentView & UIView
	
//	init(packageSizeContentView: IPackageSizeContentView & UIView) {
//		self.packageSizeContentView = packageSizeContentView
//		
//		super.init(nibName: nil, bundle: nil)
//	}
//	
//	required init?(coder: NSCoder) {
//		fatalError("init(coder:) has not been implemented")
//	}
	
	override func loadView() {
		self.view = packageSizeContentView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
}
