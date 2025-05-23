import SnapKit
import UIKit

final class DetailButtons: UIView {
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("담기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()

    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("X", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()

    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [cancelButton, addButton])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        return stackView
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
        addSubview(buttonStackView)

        buttonStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }

        cancelButton.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.width.equalTo(addButton.snp.width).multipliedBy(0.25)
        }

        addButton.snp.makeConstraints {
            $0.height.equalTo(50)
        }
    }
}
