import SwiftUI

struct WinnersView: View {
    @ObservedObject var state: AppState
    
    var body: some View {
        VStack {
            if let winners = state.winners {
                List {
                    Section {
                        HStack {
                            Spacer()
                            Text("\(winners.annual.winner) the \(winners.annual.title)")
                            Spacer()
                        }.listRowSeparator(.hidden, edges: .all)
                        HStack {
                            Spacer()
                            Text(winners.annual.gameName)
                            Spacer()
                        }.listRowSeparator(.hidden, edges: .all)
                        HStack {
                            Spacer()
                            Text(winners.annual.date)
                            Spacer()
                        }.listRowSeparator(.hidden, edges: .all)
                        HStack {
                            Spacer()
                            Text(winners.annual.social)
                            Spacer()
                        }.listRowSeparator(.hidden, edges: .all)
                    } header: {
                        Text("Annual:")
                            .font(.title)
                    }
                    Section {
                        HStack {
                            Spacer()
                            Text("\(winners.keynote.winner) the \(winners.keynote.title)")
                            Spacer()
                        }.listRowSeparator(.hidden, edges: .all)
                        HStack {
                            Spacer()
                            Text(winners.keynote.gameName)
                            Spacer()
                        }.listRowSeparator(.hidden, edges: .all)
                        HStack {
                            Spacer()
                            Text(winners.keynote.date)
                            Spacer()
                        }.listRowSeparator(.hidden, edges: .all)
                        HStack {
                            Spacer()
                            Text(winners.keynote.social)
                            Spacer()
                        }.listRowSeparator(.hidden, edges: .all)
                    } header: {
                        Text("Keynote:")
                            .font(.title)
                    }
                    Section {
                        HStack {
                            Spacer()
                            Text("\(winners.flexies.winner) the \(winners.flexies.title)")
                            Spacer()
                        }.listRowSeparator(.hidden, edges: .all)
                        HStack {
                            Spacer()
                            Text(winners.flexies.gameName)
                            Spacer()
                        }.listRowSeparator(.hidden, edges: .all)
                        HStack {
                            Spacer()
                            Text(winners.flexies.date)
                            Spacer()
                        }.listRowSeparator(.hidden, edges: .all)
                    } header: {
                        Text("Flexies:")
                            .font(.title)
                    }
                }
            }
        }
            .navigationTitle("Current Winners") 
            .task {
                do {
                    try await WinnersFetcher.fetchWinners()
                } catch {
                    print("Error occurred")
                }
            }
    }
}

struct WinnersView_Previews: PreviewProvider {
    static var previews: some View {
        WinnersView(state: AppState.shared)
    }
}
