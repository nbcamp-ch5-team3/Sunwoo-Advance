protocol SearchBookUseCase {
    func execute(query: String, completion: @escaping (Result<[Book], Error>) -> Void)
}
