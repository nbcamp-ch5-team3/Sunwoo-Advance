import RxSwift

final class DefaultBookRepository: BookRepository {
    private let bookDataSource: BookDataSource

    init(bookDataSource: BookDataSource) {
        self.bookDataSource = bookDataSource
    }

    func searchBooks(query: String) -> Single<[Book]> {
        bookDataSource.searchBooks(query: query)
    }
}
