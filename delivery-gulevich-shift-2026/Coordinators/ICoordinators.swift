import Foundation
import UIKit

protocol ICoordinator: AnyObject {
	func start()
}

protocol IAppCoordinator: AnyObject {
	
	var window: UIWindow { get }
	
	init(scene: UIWindowScene)
	
	func start()
}
