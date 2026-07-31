import UIKit

final class PackageSizeTableViewCell: UITableViewCell {
	
	static let identifier = String(describing: PackageSizeTableViewCell.self)
	
	override init(style: UITableViewCell.CellStyle,
				  reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
