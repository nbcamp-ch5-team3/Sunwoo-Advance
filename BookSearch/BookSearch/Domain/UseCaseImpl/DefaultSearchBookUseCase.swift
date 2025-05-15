final class DefaultSearchBookUseCase: SearchBookUseCase {
    private let bookRepository: BookRepository

    init(bookRepository: BookRepository) {
        self.bookRepository = bookRepository
    }

    func execute(query: String, completion: @escaping (Result<[Book], any Error>) -> Void) {
        bookRepository.searchBooks(query: query, completion: completion)
    }
}
