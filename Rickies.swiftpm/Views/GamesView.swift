import SwiftUI

struct GamesView: View {
    @ObservedObject var state: AppState
    @State var searchText: String = ""
    var body: some View {
        VStack {
            List {
                ForEach(searchResults, id: \.datePicked) { result in
                    Section {
                        Text("Game Type: \(result.gameType)")
                        Text("Date Picked: \(result.datePicked)")
                        Text("Date Graded: \(result.dateGraded)")
                        if let mainGame = result.mainGame {
                            NavigationLink {
                                PicksView(picks: mainGame.picks)
                            } label: {
                                Text("Main Game Picks")
                            }

                        }
                        if let theFlexies = result.theFlexies {
                            NavigationLink {
                                PicksView(picks: theFlexies.picks)
                            } label: {
                                Text("The Flexies Picks")
                            }
                        }
                        if let nongraded = result.nongraded {
                            NavigationLink {
                                PicksView(picks: nongraded.picks)
                            } label: {
                                Text("Nongraded picks")
                            }
                        }
                    } header: {
                        Text(result.name)
                    }
                }
            }
        }
        .navigationTitle("Past Games")
        .task {
            do {
                try await GamesFetcher.fetchGames()
            } catch {
                print("error fetching games")
            }
        }
    }
    
    var searchResults: [Game] {
        if searchText.isEmpty {
            return state.games ?? []
        } else {
            if let games = state.games {
                return games.filter {
                    if let relevantEpisodes = $0.relevantEpisodes {
                        return $0.name.contains(searchText) ||
                        $0.gameType.contains(searchText) ||
                        relevantEpisodes.contains {
                            $0.title.range(of: searchText, options: .caseInsensitive) != nil ||
                            $0.url.range(of: searchText, options: .caseInsensitive) != nil
                        }
                    } else {
                        return $0.name.contains(searchText) || $0.gameType.contains(searchText)
                    }
                }
            } else { return [] }
        }
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView(state: AppState.shared)
    }
}
