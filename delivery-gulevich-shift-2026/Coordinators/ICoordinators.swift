import Foundation
import UIKit

protocol IMethodOfSendCoordinator : AnyObject {
	
	var navigationController: UINavigationController? { get set }
	
	func showMethodOfSend()
}

protocol IMainCoordinator: AnyObject {
	
	var tabBarContorller: UITabBarController? { get set }
	
	func start()
	
	func showMethodOfSend()
}
