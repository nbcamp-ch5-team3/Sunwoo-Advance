extension DIContainer {
    func makeBookSearchViewContoller() -> BookSearchViewController {
        BookSearchViewController(bookSearchViewModel: makeBookSearchViewModel())
    }
}
