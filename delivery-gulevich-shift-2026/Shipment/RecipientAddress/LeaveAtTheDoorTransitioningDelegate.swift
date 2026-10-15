import UIKit

final class LeaveAtTheDoorTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {

	func presentationController(forPresented presented: UIViewController,
								presenting: UIViewController?,
								source: UIViewController) -> UIPresentationController? {
		
		return LeaveAtTheDoorPresentationController(
			presentedViewController: presented,
			presenting: presenting
		)
	}
}
