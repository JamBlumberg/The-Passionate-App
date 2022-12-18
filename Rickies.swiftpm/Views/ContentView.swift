import SwiftUI

struct ContentView: View {
    @StateObject var state = AppState.shared
    @State var showSafari: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Spacer()
                    NavigationLink(destination: {
                        WinnersView(state: state)
                    }) {
                        HStack {
                            Text("Current Winners")
                                .font(.title)
                            Image(systemName: "trophy.circle")
                                .font(.title)
                        }
                    }
                    NavigationLink(destination: {
                        CharitiesView(state: state)
                    }) {
                        HStack {
                            Text("Charitable Donations")
                                .font(.title)
                            Image(systemName: "dollarsign.circle")
                                .font(.title)
                        }
                    }
                    NavigationLink(destination: {
                        EpisodesView(state: state)
                    }) {
                        HStack {
                            Text("Episodes")
                                .font(.title)
                            Image(systemName: "headphones.circle")
                                .font(.title)
                        }
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
                        HStack {
                            Text("Past Games")
                                .font(.title)
                            Image(systemName: "calendar.circle")
                                .font(.title)
                        }
                    }
                    Spacer()
                    Button {
                        showSafari.toggle()
                    } label: {
                        Text("All data sourced from the excellant rickies.net API")
                    }.sheet(isPresented: $showSafari, content: {
                        if let url = URL(string: "https://rickies.net") {
                            SafariView(url: url)
                        }
                    })
                    .padding()
                }
                .navigationTitle("The Rickies")
            }
        }
    }
}
