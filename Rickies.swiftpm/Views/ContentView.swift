import SwiftUI

struct ContentView: View {
    @StateObject var state = AppState.shared
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: { 
                    WinnersView(state: state)
                }) { 
                    Text("Current Winners")
                        .font(.title)
                }
                // Unused for now as Charity link on rickies.net results in 404
//                NavigationLink(destination: { 
//                    CharitiesView(state: state)
//                }) { 
//                    Text("Charitable Donations")
//                        .font(.title)
//                }
                NavigationLink(destination: { 
                    EpisodesView(state: state)
                }) { 
                    Text("Episodes")
                        .font(.title)
                }
                // Unused for now as Bill Changes are formatted in HTML with internal links to other areas on rickies.net, which is non-trivial to resolve in the app 
//                NavigationLink(destination: { 
//                    BillChangesView(state: state)
//                }) { 
//                    Text("Changes to the Bill of Rickies")
//                        .font(.title)
//                }
                NavigationLink(destination: { 
                    GamesView(state: state)
                }) { 
                    Text("Past Games")
                        .font(.title)
                }
            }
            .navigationTitle("The Rickies")
        }
    }
}
