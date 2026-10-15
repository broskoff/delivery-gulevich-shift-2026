import UIKit

final class LeaveAtTheDoorPresentationController: UIPresentationController {

	override var frameOfPresentedViewInContainerView: CGRect {
		let width: CGFloat = 240
		let x = ((containerView?.bounds.width ?? 00) - width) / 2
		
		let height: CGFloat = 102
		let y = ((containerView?.bounds.height ?? 00) - height) / 2
		
		let frame = CGRect(x: x, y: y, width: width, height: height)
			return frame
	}
}
