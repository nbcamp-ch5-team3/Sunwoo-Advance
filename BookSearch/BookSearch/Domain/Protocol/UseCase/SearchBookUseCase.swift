import RxSwift

protocol SearchBookUseCase {
    func execute(query: String) -> Single<[Book]>
}
