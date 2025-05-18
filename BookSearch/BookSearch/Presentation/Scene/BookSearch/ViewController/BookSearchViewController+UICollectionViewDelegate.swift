import UIKit

extension BookSearchViewController: UICollectionViewDelegate {
    func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let book = bookSearchViewModel.book(at: indexPath.item) else { return }

        let detailVC = BookDetailViewController()
        detailVC.book = book
        detailVC.modalPresentationStyle = .automatic

        present(detailVC, animated: true, completion: nil)
    }
}
