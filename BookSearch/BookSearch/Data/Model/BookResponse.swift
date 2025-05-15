struct BookResponse: Codable {
    let documents: [Book]
}

struct Book: Codable {
    let title: String
    let authors: [String]
    let contents: String
    let price: Int
    let thumbnail: String
}
