import Alamofire

class BookDataSource {
    private let apiKey: String

    init(apiKey: String) {
        self.apiKey = apiKey
    }

    func searchBooks(query: String, completion: @escaping (Result<[Book], Error>) -> Void) {
        let url = "https://dapi.kakao.com/v3/search/book"

        let headers: HTTPHeaders = ["Authorization": "KakaoAK \(apiKey)"]
        let parameters: Parameters = ["query": query]

        AF.request(url, parameters: parameters, headers: headers)
            .validate()
            .responseDecodable(of: BookResponse.self) { response in
                switch response.result {
                case let .success(bookResponse):
                    completion(.success(bookResponse.documents))
                case let .failure(error):
                    completion(.failure(error))
                }
            }
    }
}
