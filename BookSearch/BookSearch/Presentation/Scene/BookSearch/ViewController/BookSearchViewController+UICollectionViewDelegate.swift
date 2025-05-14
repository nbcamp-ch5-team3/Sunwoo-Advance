import UIKit

extension BookSearchViewController: UICollectionViewDelegate {
    func collectionView(_: UICollectionView, didSelectItemAt _: IndexPath) {
        let detailVC = BookDetailViewController()
        detailVC.modalPresentationStyle = .automatic

        present(detailVC, animated: true, completion: nil)
    }
}
