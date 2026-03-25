import UIKit

final class CitySelectionTableViewDataSource: NSObject, UITableViewDataSource {
	
	let cities = [
		"Москва",
		"Санкт - Петербург",
		"Новосибирск",
		"Томск",
		"Новокузнецк",
		"Красноярск",
		"Екатеринбург",
		"Хабаровск"
	]
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		cities.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		guard let cell = tableView.dequeueReusableCell(
			withIdentifier: CitySelectionTableViewCell.identifire,
			for: indexPath
		) as? CitySelectionTableViewCell else { return UITableViewCell() }

		var content = cell.defaultContentConfiguration()
		content.text = cities[indexPath.row]

		cell.contentConfiguration = content
		cell.accessoryType = .disclosureIndicator
		
		return cell
	}
}
