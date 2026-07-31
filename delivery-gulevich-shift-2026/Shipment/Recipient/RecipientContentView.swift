import UIKit
import SnapKit

protocol RecipientContentViewDelegateProtocol: AnyObject {
	func didTapContinueButton()
}

protocol RecipientContentViewProtocol {
	var delegate: RecipientContentViewDelegateProtocol? { get set }
}

final class RecipientContentView: UIView, RecipientContentViewProtocol {
	
	weak var delegate: RecipientContentViewDelegateProtocol?
	
	private let shipmentTopView = ShipmentTopView(title: UIConstants.Shipment.HeaderNames.recepientTitle)
	private let scrollView = UIScrollView()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configureUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension RecipientContentView {
	
	func configureUI() {
		backgroundColor = ContentColor.shipmentBackground
		
		setupHierarchy()
		setConstraints()
		
	}
	
	func setupHierarchy() {
		addSubview(shipmentTopView)
		addSubview(scrollView)
	}
	
	func setConstraints() {
		shipmentTopView.snp.makeConstraints {
			$0.top.equalToSuperview().offset(UIConstants.Offset.topScreen)
			$0.leading.trailing.equalToSuperview()
		}
		
		scrollView.snp.makeConstraints {
			$0.top.equalTo(shipmentTopView.snp.bottom)
			$0.leading.trailing.equalToSuperview()
			$0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
		}
	}
}
