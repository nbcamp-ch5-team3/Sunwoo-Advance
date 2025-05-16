import RxSwift

final class DefaultSearchBookUseCase: SearchBookUseCase {
    private let bookRepository: BookRepository

    init(bookRepository: BookRepository) {
        self.bookRepository = bookRepository
    }

    func execute(query: String) -> Single<[Book]> {
        bookRepository.searchBooks(query: query)
    }
}
