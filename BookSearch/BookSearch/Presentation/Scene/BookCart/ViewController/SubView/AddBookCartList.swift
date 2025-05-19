import SnapKit
import UIKit

final class AddBookCartList: UIView {
    let cartTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 64
        tableView.separatorStyle = .singleLine
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUI() {
        addSubview(cartTableView)

        cartTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
