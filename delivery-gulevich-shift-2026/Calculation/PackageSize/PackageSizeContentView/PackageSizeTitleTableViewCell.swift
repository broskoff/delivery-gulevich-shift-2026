import UIKit

final class PackageSizeTitleTableViewCell: UITableViewCell {
	
	static let identifier = String(describing: PackageSizeTitleTableViewCell.self)
	
	override init(style: UITableViewCell.CellStyle,
				  reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
