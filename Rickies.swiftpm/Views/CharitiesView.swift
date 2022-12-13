import SwiftUI

struct CharitiesView: View {
    @ObservedObject var state: AppState
    var body: some View {
        Text("Charitable Donations")
            .font(.title)
            .task {
                do {
                    try await CharitiesFetcher.fetchCharities()
                } catch {
                    print("error fetching charities")
                }
            }
        
        if let charities = state.charities {
            ForEach(charities.charities.indices) {index in 
                let charity = charities.charities[index]
                Text(charity.charityName)
                Text(charity.charityURL)
                Text(charity.donator)
                Text("\(charity.donation)")
                Text(charity.game)
            }
        }
    }
}

