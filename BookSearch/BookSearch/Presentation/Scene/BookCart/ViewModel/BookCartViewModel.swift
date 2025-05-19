import UIKit

final class BookCartViewModel {
    static let shared = BookCartViewModel()

    private(set) var books: [BookCart] = []

    func fetchBooks() {
        books = CoreDataManager.shared.fetchBooks()
    }

    func addBook(_ book: Book) {
        CoreDataManager.shared.saveBook(from: book)
        fetchBooks() // 저장 후 다시 fetch
    }

    func deleteAllBooks() {
        CoreDataManager.shared.deleteAllBooks()
        books = []
    }

    func deleteBook(at index: Int) {
        let book = books[index]
        CoreDataManager.shared.deleteBook(book)
        fetchBooks()
    }
}
