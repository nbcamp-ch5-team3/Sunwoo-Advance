import SnapKit
import UIKit

final class CartCell: UITableViewCell {
    static let id = "CartCell"

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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUI() {
        [titleLabel, authorLabel, priceLabel].forEach { contentView.addSubview($0) }

        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(8)
            $0.centerY.equalToSuperview()
        }

        authorLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(4)
            $0.centerY.equalToSuperview()
        }

        priceLabel.snp.makeConstraints {
            $0.leading.equalTo(authorLabel.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(8)
            $0.centerY.equalToSuperview()
        }
    }

    func configure(with book: BookCart) {
        titleLabel.text = formatLabel(text: book.title, limit: 15)
        authorLabel.text = formatLabel(text: book.authors, limit: 5)
        priceLabel.text = "\(formatPrice(Int(book.price)))원"
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
