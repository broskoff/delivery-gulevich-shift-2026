import UIKit

enum PackageSizeItem {
	case title(String)
	case size(String)
}

final class PackageSizeTableViewDataSource: NSObject, UITableViewDataSource {
	
	let packageSizes: [PackageSizeItem] = [
		.title("Размер посылки"),
		.size("Конверт, 42х36х5 см"),
		.size("Короб XS, 17х12х9 см"),
		.size("Короб S, 23х9х10 см"),
		.size("Короб M, 33х25х15 см"),
		.size("Короб L, 32х25х38 см"),
		.size("Короб XL, 60х35х30 см")
	]
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		packageSizes.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		switch packageSizes[indexPath.row] {
		case .title(let text):
			guard let cell = tableView.dequeueReusableCell(
				withIdentifier: PackageSizeTitleTableViewCell.identifier,
				for: indexPath
			) as? PackageSizeTitleTableViewCell else { return UITableViewCell()}
			
			var content = cell.defaultContentConfiguration()
			content.text = text
			content.textProperties.font = .systemFont(ofSize: 24,
													  weight: .semibold)
			cell.contentConfiguration = content
			
			return cell
			
		case .size(let text):
			guard let cell = tableView.dequeueReusableCell(
				withIdentifier: PackageSizeTableViewCell.identifier,
				for: indexPath
			) as? PackageSizeTableViewCell else { return UITableViewCell()}
			
			var content = cell.defaultContentConfiguration()
			content.text = text
			content.textProperties.color = ContentColor.text
			content.textProperties.font = .systemFont(ofSize: 16,
													  weight: .regular)
			cell.contentConfiguration = content
			
			return cell
		}
	}
}
