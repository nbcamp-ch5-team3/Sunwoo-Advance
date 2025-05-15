import SnapKit
import UIKit

final class BookSearchViewController: UIViewController {
    private let bookSearchBarView = BookSearchBarView()
    private let sectionHeaderView = SectionHeaderView()
    private let bookSearchResultList = BookSearchResultList()

    let bookSearchViewModel: BookSearchViewModel

    init(bookSearchViewModel: BookSearchViewModel) {
        self.bookSearchViewModel = bookSearchViewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureDelegate()
        bindViewModel()
    }

    private func configureUI() {
        view.backgroundColor = .white

        [bookSearchBarView, sectionHeaderView, bookSearchResultList]
            .forEach { view.addSubview($0) }

        bookSearchBarView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide.snp.horizontalEdges).inset(8)
            $0.height.equalTo(44)
        }

        sectionHeaderView.snp.makeConstraints {
            $0.top.equalTo(bookSearchBarView.snp.bottom).offset(12)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).inset(8)
        }

        bookSearchResultList.snp.makeConstraints {
            $0.top.equalTo(sectionHeaderView.snp.bottom).offset(20)
            $0.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }

    private func configureDelegate() {
        bookSearchBarView.bookSearchBar.delegate = self

        let collectionView = bookSearchResultList.searchResultCollectionView
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(
            ResultCell.self,
            forCellWithReuseIdentifier: ResultCell.id
        )
        collectionView.register(
            SectionHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: SectionHeaderView.id
        )
    }

    private func bindViewModel() {
        bookSearchViewModel.onUpdate = { [weak self] in
            DispatchQueue.main.async {
                self?.bookSearchResultList.searchResultCollectionView.reloadData()
            }
        }
    }
}
