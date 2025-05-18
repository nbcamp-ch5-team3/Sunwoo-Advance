import SnapKit
import UIKit

final class BookDetailViewController: UIViewController {
    private let detailButtons = DetailButtons()
    private let bookDetailView = BookDetailView()

    var book: Book?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureDate()
        configureUI()
        tapDetailButtons()
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

    private func tapDetailButtons() {
        detailButtons.didTapCancelButton = { [weak self] in
            self?.dismiss(animated: true, completion: nil)
        }
    }
}
