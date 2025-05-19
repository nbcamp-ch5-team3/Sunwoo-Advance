import Foundation
import RxSwift

final class BookSearchViewModel {
    let bookSubject = BehaviorSubject(value: [Book]())

    private let disposeBag = DisposeBag()
    private let searchBookUseCase: SearchBookUseCase

    init(searchBookUseCase: SearchBookUseCase) {
        self.searchBookUseCase = searchBookUseCase
    }

    func searchBooks(with keyword: String) {
        searchBookUseCase.execute(query: keyword)
            .subscribe(
                onSuccess: { [weak self] book in
                    self?.bookSubject.onNext(book)
                },
                onFailure: { [weak self] error in
                    self?.bookSubject.onError(error)
                }
            ).disposed(by: disposeBag)
    }

    func book(at index: Int) -> Book? {
        guard let books = try? bookSubject.value() else { return nil }
        return books.indices.contains(index) ? books[index] : nil
    }
}
