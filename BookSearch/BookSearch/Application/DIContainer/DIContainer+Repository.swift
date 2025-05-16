extension DIContainer {
    func makeBookRepository() -> BookRepository {
        DefaultBookRepository(bookDataSource: makeBookDataSource())
    }
}
