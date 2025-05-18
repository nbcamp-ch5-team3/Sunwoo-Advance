import SnapKit
import UIKit

final class BookDetailView: UIView {
    private let scrollView = UIScrollView()
    private let contentVeiw = UIView()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()

    private let authorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()

    private let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        return imageView
    }()

    private let wrapperThumbnailView: UIView = {
        let view = UIView()
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 2
        view.backgroundColor = .clear
        return view
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()

    private let contentsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()

    private lazy var detailStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [titleLabel, authorLabel, wrapperThumbnailView, priceLabel, contentsLabel]
        )
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.alignment = .center
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
        addSubview(scrollView)
        scrollView.addSubview(contentVeiw)
        contentVeiw.addSubview(detailStackView)
        wrapperThumbnailView.addSubview(thumbnailImageView)

        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        contentVeiw.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView.snp.width)
        }

        detailStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(16)
        }

        thumbnailImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        thumbnailImageView.snp.makeConstraints {
            $0.height.equalTo(320)
            $0.width.equalTo(220)
        }
    }

    func configure(with book: Book) {
        titleLabel.text = book.title
        authorLabel.text = book.authors.joined(separator: ", ")
        priceLabel.text = "\(formatPrice(book.price))원"
        contentsLabel.text = book.contents

        if let url = URL(string: book.thumbnail) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.thumbnailImageView.image = image
                    }
                }
            }
        }
    }

    private func formatPrice(_ price: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: price)) ?? " "
    }
}
