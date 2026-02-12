import Foundation
import UIKit

enum Event {
	case calculateButtonTupped
	case findButtonTupped
	case departureCityTextFieldTupped
	case destinationCityTextFieldTupped
	case sizePackegeTextField
}

protocol ICoordinator: AnyObject {
	
	var tabBarContorller: UITabBarController? { get set }
	
	func eventOcurred(type: Event)
	func start()
}

protocol ICoordinating: AnyObject {
	
	var coordinator: ICoordinator? { get set }
}
