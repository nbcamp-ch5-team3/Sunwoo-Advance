import RxSwift

protocol BookRepository {
    func searchBooks(query: String) -> Single<[Book]>
}
