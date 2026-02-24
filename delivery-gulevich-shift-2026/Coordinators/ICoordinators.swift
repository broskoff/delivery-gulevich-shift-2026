import Foundation
import UIKit

protocol IMethodOfSendCoordinator : ICoordinator {
	func didFinish()
}

protocol IMainCoordinator: ICoordinator {
	func showMethodOfSend()
}

protocol ICoordinator: AnyObject {
	var childCoordinators: [ICoordinator] { get set }
	
	func start()
}
						
