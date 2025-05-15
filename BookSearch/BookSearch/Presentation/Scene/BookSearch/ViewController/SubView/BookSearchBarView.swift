import SnapKit
import UIKit

final class BookSearchBarView: UIView {
    let bookSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.searchBarStyle = .minimal
        return searchBar
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
        addSubview(bookSearchBar)

        bookSearchBar.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
