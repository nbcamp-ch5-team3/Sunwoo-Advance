import UIKit
import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "BookSearch")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("CoreData Load Error: \(error)")
            }
        }
        return container
    }()

    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }

    // Create
    func saveBook(title: String, authors: String, price: Int64) {
        let book = BookCart(context: context)
        book.title = title
        book.authors = authors
        book.price = price

        do {
            try context.save()
            print("Save success: \(title)")
        } catch {
            print("Save fail")
        }
    }

    func saveBook(from book: Book) {
        saveBook(title: book.title, authors: book.authors.joined(separator: ", "), price: Int64(book.price))
    }

    // Read
    func fetchBooks() -> [BookCart] {
        let request: NSFetchRequest<BookCart> = BookCart.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: false)]

        do {
            print("Fetch success")
            return try context.fetch(request)
        } catch {
            print("Fetch fail")
            return []
        }
    }

    // Delete All
    func deleteAllBooks() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = BookCart.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try context.execute(deleteRequest)
            try context.save()
            print("Delete all success")
        } catch {
            print("Delete fail")
        }
    }
}
