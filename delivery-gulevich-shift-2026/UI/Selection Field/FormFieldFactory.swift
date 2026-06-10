import UIKit

final class FormFieldFactory {
	
	static func make(title: String,
					 config: SelectionFieldConfig,
					 delegate: SelectionFieldProtocol?) -> UIStackView {
		let label = SelectionFieldLabel()
		label.create(withText: title)
		
		let field = SelectionField()
		field.delegate = delegate
		field.makeComponent(using: config)
		
		let stackView = UIStackView()
		stackView.backgroundColor = .white
		stackView.axis = .vertical
		stackView.spacing = UIConstants.Spacing.medium
		
		[label, field].forEach {
			stackView.addArrangedSubview($0)
		}
		return stackView
	}
}
