import SwiftUI

struct CharitiesView: View {
    @ObservedObject var state: AppState
    var body: some View {
        VStack {
            if let charities = state.charities {
                List {
                    ForEach(charities, id: \.charityName) { charity in
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
        }
        .font(.title)
        .task {
            do {
                try await CharitiesFetcher.fetchCharities()
            } catch {
                print("error fetching charities")
            }
        }
        .navigationTitle(Text("Charitable Donations"))
    }
}

