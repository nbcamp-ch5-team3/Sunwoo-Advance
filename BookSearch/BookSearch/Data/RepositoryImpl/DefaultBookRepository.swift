final class DefaultBookRepository: BookRepository {
    private let bookDataSource: BookDataSource

    init(bookDataSource: BookDataSource) {
        self.bookDataSource = bookDataSource
    }

    func searchBooks(query: String, completion: @escaping (Result<[Book], any Error>) -> Void) {
        bookDataSource.searchBooks(query: query, completion: completion)
    }
}
