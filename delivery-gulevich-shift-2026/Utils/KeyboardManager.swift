import UIKit

protocol KeyboardManagerDependenciesProtocol: AnyObject {
	var keyboardScrollView: UIScrollView { get }
	var keyboardTextFields: [UITextField] { get }
}

final class KeyboardManager: NSObject, UITextFieldDelegate {
	
	private let scrollView: UIScrollView
	private let textFields: [UITextField]
	private let originalContentInset: UIEdgeInsets
	private let tapGesture = UITapGestureRecognizer()
	private var keyboardFrameInScrollView: CGRect?
	
	init(dependencies: KeyboardManagerDependenciesProtocol) {
		self.scrollView = dependencies.keyboardScrollView
		self.textFields = dependencies.keyboardTextFields
		self.originalContentInset = dependencies.keyboardScrollView.contentInset
		super.init()
		
		NotificationCenter.default.addObserver(self,
											   selector: #selector(keyboardWillShow),
											   name: UIResponder.keyboardWillShowNotification,
											   object: nil)
		
		NotificationCenter.default.addObserver(self,
											   selector: #selector(keyboardWillHide),
											   name: UIResponder.keyboardWillHideNotification,
											   object: nil)
		
		scrollView.addGestureRecognizer(tapGesture)
		tapGesture.addTarget(self, action: #selector(dismissKeyboard))
		
		for textField in textFields {
			textField.delegate = self
		}
	}
	
	@objc
	private func keyboardWillShow(notification: Notification) {
		guard let userInfo = notification.userInfo else { return }
		
		let keyboardFrameValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
		
		guard
			let keyboardFrame = keyboardFrameValue?.cgRectValue else { return }
		
		let keyboardInScrollView = scrollView.convert(keyboardFrame, from: nil)
		
		let keyboardScrollViewIntersection = scrollView.bounds.intersection(keyboardInScrollView)
		
		if !keyboardScrollViewIntersection.isNull {
			let newBottomInset = originalContentInset.bottom + keyboardScrollViewIntersection.height
			var updatedContentInset = originalContentInset
			updatedContentInset.bottom = newBottomInset
			scrollView.contentInset = updatedContentInset
		}
		
		keyboardFrameInScrollView = keyboardInScrollView
		scrollToActiveTextField()
	}
	
	@objc
	private func keyboardWillHide(notification: Notification) {
		scrollView.contentInset = originalContentInset
		keyboardFrameInScrollView = nil
	}
	
	@objc
	private func dismissKeyboard() {
		let activeTextField = textFields.first { textField in
			textField.isFirstResponder
		}
		
		guard let activeTextField = activeTextField else { return }
		activeTextField.resignFirstResponder()
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		guard
			let index = textFields.firstIndex(of: textField) else { return false }
		
		let nextIndex = index + 1
		
		if nextIndex < textFields.count {
			let nextField = textFields[nextIndex]
			nextField.becomeFirstResponder()
			scrollToActiveTextField()
		} else {
			textField.resignFirstResponder()
		}
		
		return true
	}
	
	private func scrollToActiveTextField() {
		let activeTextField = textFields.first { textField in
			textField.isFirstResponder
		}
		
		guard let activeTextField = activeTextField else { return }
		let activeTextFieldFrameInScrollView = scrollView.convert(activeTextField.bounds, from: activeTextField)
		
		guard let keyboard = keyboardFrameInScrollView else { return }
		let keyboardActiveTextFieldIntersection = keyboard.intersection(activeTextFieldFrameInScrollView)
		
		if !keyboardActiveTextFieldIntersection.isNull {
			scrollView.scrollRectToVisible(activeTextFieldFrameInScrollView, animated: true)
		}
	}

	deinit {
		NotificationCenter.default.removeObserver(self)
	}
}
