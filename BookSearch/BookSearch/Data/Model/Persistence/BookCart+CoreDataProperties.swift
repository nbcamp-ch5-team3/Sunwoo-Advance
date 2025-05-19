import CoreData
import Foundation

public extension BookCart {
    @nonobjc class func fetchRequest() -> NSFetchRequest<BookCart> {
        return NSFetchRequest<BookCart>(entityName: "BookCart")
    }

    @NSManaged var title: String
    @NSManaged var authors: String
    @NSManaged var price: Int64
}

extension BookCart: Identifiable {}
