import Foundation

struct CharitiesFetcher {
    enum CharitiesFetcherError: Error {
        case invalid
        case missingData
    }
    
    @MainActor
    static func fetchCharities() async throws {
        guard let url = URL(string: "https://rickies.net/api/v1/charity.json") else {
            print("charity url is invalid")
            throw CharitiesFetcherError.invalid
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let charitiesResult = try decoder.decode(Charities.self, from: data)
        print(charitiesResult)
        AppState.shared.charities = charitiesResult
    }
}
