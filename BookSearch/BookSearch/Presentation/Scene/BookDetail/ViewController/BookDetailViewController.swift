import SnapKit
import UIKit

protocol BookDetailViewControllerDelegate: AnyObject {
    func didTapAddButton(title: String)
}

final class BookDetailViewController: UIViewController {
    private let detailButtons = DetailButtons()
    private let bookDetailView = BookDetailView()

    var book: Book?
    weak var delegate: BookDetailViewControllerDelegate? // delegate 프로퍼티

    override func viewDidLoad() {
        super.viewDidLoad()
        configureDate()
        configureUI()
        buttonAddTarget()
    }

    private func configureDate() {
        guard let book = book else { return }
        bookDetailView.configure(with: book)
    }

    private func configureUI() {
        view.backgroundColor = .white

        [bookDetailView, detailButtons].forEach { view.addSubview($0) }

        bookDetailView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide.snp.horizontalEdges).inset(16)
            $0.bottom.equalTo(detailButtons.snp.top).inset(12)
        }

        detailButtons.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide.snp.horizontalEdges)
        }
    }

    private func buttonAddTarget() {
        detailButtons.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        detailButtons.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }

    @objc private func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }

    @objc private func addButtonTapped() {
        dismiss(animated: true) {
            self.delegate?.didTapAddButton(title: self.book?.title ?? " ")
        }
    }
}
