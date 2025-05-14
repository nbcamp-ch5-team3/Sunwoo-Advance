import SnapKit
import UIKit

class BookSearchViewController: UIViewController {
    private let sectionHeaderView = SectionHeaderView()
    private let bookSearchResultList = BookSearchResultList()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureDelegate()
    }

    private func configureUI() {
        view.backgroundColor = .white

        [sectionHeaderView, bookSearchResultList].forEach { view.addSubview($0) }

        sectionHeaderView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(10)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).inset(10)
        }

        bookSearchResultList.snp.makeConstraints {
            $0.top.equalTo(sectionHeaderView.snp.bottom).offset(20)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide.snp.horizontalEdges)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }

    private func configureDelegate() {
        bookSearchResultList.searchResultCollectionView.delegate = self
        bookSearchResultList.searchResultCollectionView.dataSource = self
    }
}
