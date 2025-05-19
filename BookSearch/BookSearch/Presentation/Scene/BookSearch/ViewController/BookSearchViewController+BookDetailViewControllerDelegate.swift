import UIKit

extension BookSearchViewController: BookDetailViewControllerDelegate {
    func didTapAddButton(title: String) {
        let alert = UIAlertController(
            title: "알림",
            message: "\"\(title)\" 책 담기 완료!",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }
}
