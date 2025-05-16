import Alamofire
import RxSwift

class BookDataSource {
    private let apiKey: String

    init(apiKey: String) {
        self.apiKey = apiKey
    }

    func searchBooks(query: String) -> Single<[Book]> {
        return Single.create { observer in
            let url = "https://dapi.kakao.com/v3/search/book"
            let headers: HTTPHeaders = ["Authorization": "KakaoAK \(self.apiKey)"]
            let parameters: Parameters = ["query": query]

            AF.request(url, parameters: parameters, headers: headers)
                .validate()
                .responseDecodable(of: BookResponse.self) { response in
                    switch response.result {
                    case let .success(bookResponse):
                        observer(.success(bookResponse.documents))
                    case let .failure(error):
                        observer(.failure(error))
                    }
                }
            return Disposables.create()
        }
    }
}
