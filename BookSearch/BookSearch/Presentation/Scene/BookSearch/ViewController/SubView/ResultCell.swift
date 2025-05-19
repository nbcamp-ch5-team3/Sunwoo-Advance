import SnapKit
import UIKit

final class ResultCell: UICollectionViewCell {
    static let id = "ResultCell"

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()

    private let authorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        return label
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
        contentView.layer.cornerRadius = 12
        contentView.clipsToBounds = true
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 1

        [titleLabel, authorLabel, priceLabel]
            .forEach { contentView.addSubview($0) }

        titleLabel.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview().inset(8)
        }

        authorLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(4)
            $0.top.bottom.equalToSuperview().inset(8)
        }

        priceLabel.snp.makeConstraints {
            $0.leading.equalTo(authorLabel.snp.trailing).offset(12)
            $0.top.bottom.trailing.equalToSuperview().inset(8)
        }
    }

    func configure(with book: Book) {
        titleLabel.text = formatLabel(text: book.title, limit: 15)
        authorLabel.text = formatLabel(text: book.authors.first ?? " ", limit: 5)
        priceLabel.text = "\(formatPrice(book.price))원"
    }

    private func formatLabel(text: String, limit: Int) -> String {
        return text.count > limit ? String(text.prefix(limit)) + "..." : text
    }

    private func formatPrice(_ price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: price)) ?? " "
    }
}
