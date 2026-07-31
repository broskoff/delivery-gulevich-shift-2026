import UIKit

protocol IPackageSizeContentView: AnyObject {
	func configUI()
}

protocol PackageSizeContentViewDelegateProtocol: AnyObject {
	func didSelectedSizePackage(_ size: PackageSizeItem)
}

final class PackageSizeContentView: UIView {
	
	weak var delegate: PackageSizeContentViewDelegateProtocol?
	
	private let packageSizeTableViewDataSource = PackageSizeTableViewDataSource()
	
	lazy var tableView: UITableView = {
		let tableView = UITableView()
		tableView.register(
			PackageSizeTitleTableViewCell.self,
			forCellReuseIdentifier: PackageSizeTitleTableViewCell.identifier
		)
		tableView.register(
			PackageSizeTableViewCell.self,
			forCellReuseIdentifier: PackageSizeTableViewCell.identifier
		)
		tableView.delegate = self
		tableView.separatorStyle = .none
		tableView.dataSource = packageSizeTableViewDataSource
		tableView.rowHeight = 56
		return tableView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configUI() 
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension PackageSizeContentView: IPackageSizeContentView {
	func configUI() {
		addSubview(tableView)
		
		tableView.snp.makeConstraints {
			$0.edges.equalToSuperview()
		}
	}
}

extension PackageSizeContentView: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let size = packageSizeTableViewDataSource.packageSizes[indexPath.row]

		delegate?.didSelectedSizePackage(size)
	}
}
