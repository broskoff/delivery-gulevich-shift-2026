protocol DataValidationPresenterProtocol: AnyObject {
	func viewDidLoad()
	func userDidTapCheckoutButton()
}

enum DataValidationError: Error {
	case missingRequiredData
}

final class DataValidationPresenter: DataValidationPresenterProtocol {
	private let data: DataToDelivery
	
	weak var view: DataValidationViewControllerProtocol?
	weak var output: ShipmentOutputProtocol?
	
	
	init(output: ShipmentOutputProtocol, data: DataToDelivery) {
		self.output = output
		self.data = data
	}
	
	func viewDidLoad() {
		switch makeCards() {
		case .success(let cards):
			view?.showData(cards)
		case .failure(let error):
			view?.showError(error)
		}
	}
	
	func userDidTapCheckoutButton() {
		output?.openSuccess()
	}
}

private extension DataValidationPresenter {
	
	func makeCards() -> Result<[DataValidationCardModel], DataValidationError> {
		var cards: [DataValidationCardModel] = []
		
		guard
			let recipientCard = makePersonCard(person: data.recipient,
											   title: UIConstants.Shipment.HeaderNames.recepientTitle),
			let senderCard = makePersonCard(person: data.sender,
											title: UIConstants.Shipment.HeaderNames.senderTitle),
			let senderAddressCard = makeAddressCard(address: data.senderAddress,
													title: UIConstants.Shipment.HeaderNames.senderAddressTitle),
			let recipientAddressCard = makeAddressCard(address: data.recipientAddress,
													   title: UIConstants.Shipment.HeaderNames.recipientAddressTitle)
		else {
			return .failure(.missingRequiredData)
		}
		
		cards.append(recipientCard)
		cards.append(senderCard)
		cards.append(senderAddressCard)
		cards.append(recipientAddressCard)
		
		return .success(cards)
	}
	
	func makePersonCard(person: Person, title: String) -> DataValidationCardModel? {
		guard
			let name = person.name,
			let surname = person.surname,
			let patronymic = person.patronymic,
			let phone = person.phone
		else {
			return nil
		}
		
		let personCard = DataValidationCardModel(
			nameCard: title,
			firstFieldTitle: "ФИО",
			firstFieldValue: "\(surname) \(name) \(patronymic)",
			secondFieldTitle: "Телефон",
			secondFieldValue: phone
		)
		
		return personCard
	}
	
	func makeAddressCard(address: Address, title: String) -> DataValidationCardModel? {
		guard
			let street = address.street,
			let house = address.house,
			let apartment = address.apartment
		else {
			return nil
		}
		
		let addressCard = DataValidationCardModel(
			nameCard: title,
			firstFieldTitle: "Адрес",
			firstFieldValue: "\(street), \(house)-\(apartment)",
			secondFieldTitle: "Заметка",
			secondFieldValue: address.noteForCourier ?? "Не указано"
		)
			
		return addressCard
	}
}
