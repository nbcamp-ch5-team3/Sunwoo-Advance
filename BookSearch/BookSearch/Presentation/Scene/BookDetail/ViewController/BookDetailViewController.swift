import SnapKit
import UIKit

class BookDetailViewController: UIViewController {
    private let detailButtons = DetailButtons()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        tapDetailButtons()
    }

    private func configureUI() {
        view.backgroundColor = .white

        for item in [detailButtons] {
            view.addSubview(item)
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
