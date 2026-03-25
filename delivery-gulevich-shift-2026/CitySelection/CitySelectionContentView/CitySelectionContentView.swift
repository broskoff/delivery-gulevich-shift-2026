import UIKit

protocol ICitySelectionContentView: AnyObject {
	func configUI()
}

final class CitySelectionContentView: UIView {
	
	private let topView = UIView()
	private let titleStackView = UIStackView()
	
	private let citySelectionTableViewDataSource = CitySelectionTableViewDataSource()
	
	private lazy var tableView: UITableView = {
		let tableView = UITableView()
		tableView.register(
			CitySelectionTableViewCell.self,
			forCellReuseIdentifier: CitySelectionTableViewCell.identifire
		)
		tableView.dataSource = citySelectionTableViewDataSource
		tableView.separatorStyle = .none
		tableView.delegate = self
		
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

extension CitySelectionContentView: ICitySelectionContentView {
	func configUI() {
		backgroundColor = .white
		
		setupHierarchy()
		
		configureTopView()
		
		configureTableView()
	}
	
	func setupHierarchy() {
		addSubview(topView)
		topView.addSubview(titleStackView)
		
		addSubview(tableView)
	}
}
	
extension CitySelectionContentView {
		
	func configureTopView() {
		topView.snp.makeConstraints {
			$0.top.equalToSuperview().offset(UIConstants.Offset.topScreen)
			$0.leading.trailing.equalToSuperview()
		}
		
		configureTitleStackView()
		configureTitleLabel()
	}
	
	func configureTitleStackView() {
		titleStackView.axis = .vertical
		
		titleStackView.snp.makeConstraints {
			$0.edges.equalToSuperview().inset(20)
		}
	}
	
	func configureTitleLabel() {
		let titleLabel = UILabel()
		titleStackView.addArrangedSubview(titleLabel)
		
		titleLabel.text = UIConstants.CitySelection.Headers.title
		titleLabel.textAlignment = .center
		titleLabel.font = .systemFont(ofSize: 28, weight: .bold)
		
		titleLabel.snp.makeConstraints {
			$0.centerX.equalToSuperview()
		}
	}
	
	func configureTableView() {
		tableView.snp.makeConstraints {
			$0.top.equalTo(topView.snp.bottom).offset(16)
			$0.leading.trailing.equalToSuperview()
			$0.bottom.equalTo(safeAreaLayoutGuide)
		}
	}
}

extension CitySelectionContentView: UITableViewDelegate {
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		UIConstants.CitySelection.Heights.cell
	}
}
