protocol BookRepository {
    func searchBooks(query: String, completion: @escaping (Result<[Book], Error>) -> Void)
}
