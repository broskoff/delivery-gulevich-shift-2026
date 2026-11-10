struct DeliveryDetails {
	var type: String?
	var price: String?
	var days: String?
	var leaveAtTheDoor = false
	var payer: String?
}

struct Person {
	var surname: String?
	var name: String?
	var patronymic: String?
	var phone: String?
}

struct Address {
	var street: String?
	var house: String?
	var apartment: String?
	var noteForCourier: String?
}

struct DataToDelivery {
	var recipient = Person()
	var recipientAddress = Address()
	
	var sender = Person()
	var senderAddress = Address()
	
	var deliveryDetails = DeliveryDetails()
}
