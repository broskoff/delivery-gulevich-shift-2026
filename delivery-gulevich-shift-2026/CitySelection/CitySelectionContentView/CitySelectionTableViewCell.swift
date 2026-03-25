import UIKit

final class CitySelectionTableViewCell: UITableViewCell {
	
	static let identifier = String(describing: CitySelectionTableViewCell.self)
	
	override init(style: UITableViewCell.CellStyle,
				  reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
