extension DIContainer {
    func makeBookDataSource() -> BookDataSource {
        BookDataSource(apiKey: apiKey)
    }
}
