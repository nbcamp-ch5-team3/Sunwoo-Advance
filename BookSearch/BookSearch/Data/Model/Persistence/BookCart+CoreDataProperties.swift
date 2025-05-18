import Foundation
import CoreData


extension BookCart {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BookCart> {
        return NSFetchRequest<BookCart>(entityName: "BookCart")
    }

    @NSManaged public var title: String
    @NSManaged public var authors: String
    @NSManaged public var price: Int64

}

extension BookCart : Identifiable {

}
