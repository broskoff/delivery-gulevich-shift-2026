import Foundation
import UIKit

enum UIConstants {
	enum TabBarItem {
		enum Title {
			static let calculation = "Расчет"
			static let history = "История"
			static let profile = "Профиль"
		}
		
		enum Image {
			static let calculation = "plus.forwardslash.minus"
			static let history = "clock"
			static let profile = "person.crop.circle"
		}
	}
	
	enum Calculation {
		enum HeaderNames {
			static let title = "Мы доставим\nваш заказ"
			static let subtitle = "Отправляйте посылки в приложении\nШифт Delivery"
		}
		
		enum ButtonNames {
			static let calculate = "Расчитать"
			static let find = "Найти"
		}
		
		enum CardNames {
			static let calculate = "Рассчитать доставку"
			static let track = "Отследить посылку"
		}
		
		enum Placeholder {
			static let selectCity = "Выберите город"
			static let orderNumber = "Номер заказа"
		}
		
		enum LabelNames {
			static let cityFrom = "Город отправки"
			static let cityTo = "Город назначения"
		}
		
		enum Heights {
			static let button: CGFloat = 56
		}
	}
	
	enum MethodOfSend {
		enum HeaderNames {
			static let title  = "Способ отправки"
		}
	}
	
	enum SectionUnderDevelopment {
		static let label = "Раздел находится в стадии разработки"
		static let labelTheme = "Раздел находится в стадии разработки,\n пока можно выбрать тему приложения"
	}
	
	enum Spacing {
		static let extraSmall: CGFloat = 8
		static let small: CGFloat = 16
		static let medium: CGFloat = 24
		static let large: CGFloat = 32
	}
	
	enum Inset {
		static let extraSmall: CGFloat = 8
		static let small: CGFloat = 16
		static let medium: CGFloat = 24
		static let large: CGFloat = 32
	}
	
	enum Offset {
		static let topScreen = 40
	}
	
	enum Layer {
		enum CornerRadius {
			static let extraSmall: CGFloat = 8
			static let small: CGFloat = 16
			static let medium: CGFloat = 24
		}
	}
	
	enum CitySelection {
		enum Headers {
			static let title  = "Куда"
		}
		
		enum Heights {
			static let cell: CGFloat = 56
		}
	}
	
	enum PackageSize {
		enum Header {
			static let title  = "Размер посылки"
		}
	}
}
