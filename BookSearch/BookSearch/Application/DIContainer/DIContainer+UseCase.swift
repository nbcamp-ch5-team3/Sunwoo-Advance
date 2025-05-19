extension DIContainer {
    func makeSearchBookUseCase() -> SearchBookUseCase {
        DefaultSearchBookUseCase(bookRepository: makeBookRepository())
    }
}
