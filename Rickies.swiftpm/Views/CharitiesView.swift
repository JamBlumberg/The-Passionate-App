import SwiftUI

struct CharitiesView: View {
    @ObservedObject var state: AppState
    @State var searchText: String = ""
    var body: some View {
        VStack {
            List {
                ForEach(searchResults, id: \.charityName) { charity in
                    Section {
                        Text(charity.charityURL)
                        Text("Donator: \(charity.donator)")
                        Text("Donation Amount: $\(charity.donation)")
                        Text(charity.game)
                    } header: {
                        Text(charity.charityName)
                    }
                }
            }
        }
        .searchable(text: $searchText, prompt: "Search by donator, charity or game")
        .task {
            do {
                try await CharitiesFetcher.fetchCharities()
            } catch {
                print("error fetching charities")
            }
        }
        .navigationTitle(Text("Charitable Donations"))
    }
    
    var searchResults: [Charity] {
        if searchText.isEmpty {
            return state.charities ?? []
        } else {
            if let charities = state.charities {
                return charities.filter { charity in
                    charity.charityName.contains(searchText) ||
                    charity.donator.contains(searchText) ||
                    charity.game.contains(searchText)
                }
            } else  { return [] }
        }
    }
}

