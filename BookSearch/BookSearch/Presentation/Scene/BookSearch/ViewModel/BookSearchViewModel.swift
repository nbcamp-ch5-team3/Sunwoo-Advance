import Foundation

final class BookSearchViewModel {
    var books = [Book]()
    var onUpdate: (() -> Void)? // View가 업데이트 됐을 때 알려주는 클로저

    private let searchBookUseCase: SearchBookUseCase

    init(searchBookUseCase: SearchBookUseCase) {
        self.searchBookUseCase = searchBookUseCase
    }

    func searchBooks(with keyword: String) {
        searchBookUseCase.execute(query: keyword) { [weak self] result in
            switch result {
            case let .success(books):
                self?.books = books
                self?.onUpdate?()
            case let .failure(error):
                print("Search Fail: \(error.localizedDescription)")
                self?.books = []
                self?.onUpdate?()
            }
        }
    }

    func book(at index: Int) -> Book {
        books[index]
    }
}
