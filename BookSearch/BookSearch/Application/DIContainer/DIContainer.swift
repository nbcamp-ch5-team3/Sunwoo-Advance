final class DIContainer {
    let apiKey: String

    init(apiKey: String = APIKey.kakaoAPIKey) {
        self.apiKey = apiKey
    }
}
