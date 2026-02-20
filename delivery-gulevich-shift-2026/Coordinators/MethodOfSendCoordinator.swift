import Foundation
import UIKit

final class MethodOfSendCoordinator: IMethodOfSendCoordinator {
	var navigationController: UINavigationController?
	
	func showMethodOfSend() {
		let vc = MethodOfSendViewController()
		navigationController?.pushViewController(vc, animated: true)
	}
}
