import UIKit

extension BookSearchViewController: UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        bookSearchViewModel.books.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ResultCell.id, for: indexPath) as? ResultCell else { return UICollectionViewCell() }

        cell.configure(with: bookSearchViewModel.book(at: indexPath.item))
        return cell
    }

    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }

        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: SectionHeaderView.id,
            for: indexPath
        ) as? SectionHeaderView else {
            return UICollectionReusableView()
        }

        header.configure(with: "검색 결과")
        return header
    }
}
