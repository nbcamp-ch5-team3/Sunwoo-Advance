import SnapKit
import UIKit

protocol BookCartViewControllerDelegate: AnyObject {
    func didTapAgainAddButton()
}

final class BookCartViewController: UIViewController {
    weak var delegate: BookCartViewControllerDelegate?

    private let cartHeaderView = CartHeaderView()
    private let addBookCartList = AddBookCartList()
    let bookCartViewModel = BookCartViewModel.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        buttonAddTarget()
        configureDelegate()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bindViewModel()
    }

    private func configureUI() {
        view.backgroundColor = .white

        [cartHeaderView, addBookCartList].forEach { view.addSubview($0) }

        cartHeaderView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide.snp.horizontalEdges).inset(16)
        }

        addBookCartList.snp.makeConstraints {
            $0.top.equalTo(cartHeaderView.snp.bottom).offset(16)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide.snp.horizontalEdges)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }

    private func bindViewModel() {
        bookCartViewModel.fetchBooks()
        addBookCartList.cartTableView.reloadData()
    }

    private func configureDelegate() {
        addBookCartList.cartTableView.dataSource = self
        addBookCartList.cartTableView.delegate = self
        addBookCartList.cartTableView.register(CartCell.self, forCellReuseIdentifier: CartCell.id)
    }

    private func buttonAddTarget() {
        cartHeaderView.deleteAllButton.addTarget(
            self,
            action: #selector(deleteAllButtonTapped),
            for: .touchUpInside
        )

        cartHeaderView.againAddButton.addTarget(
            self,
            action: #selector(againAddButtonTapped),
            for: .touchUpInside
        )
//        print("delegate 연결 상태: \(delegate != nil ? "O" : "X")")
    }

    @objc private func deleteAllButtonTapped() {
        bookCartViewModel.deleteAllBooks()
        addBookCartList.cartTableView.reloadData()
    }

    @objc private func againAddButtonTapped() {
        delegate?.didTapAgainAddButton()
        tabBarController?.selectedIndex = 0

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            if let searchVC = self?.tabBarController?.viewControllers?.first as? BookSearchViewController {
                searchVC.activeSearchBar()
            }
        }
    }
}
