extension DIContainer {
    func makeBookSearchViewModel() -> BookSearchViewModel {
        BookSearchViewModel(searchBookUseCase: makeSearchBookUseCase())
    }
}
