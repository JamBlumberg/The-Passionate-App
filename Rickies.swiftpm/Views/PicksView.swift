import SwiftUI

struct PicksView: View {
    @State var picks: [Picks]
    
    var body: some View {
        VStack{
            List {
                ForEach(picks, id: \.text) { pick in
                    Text("Host: \(pick.host)")
                    Text(pick.text)
                    if let score = pick.score {
                        Text("Score: \(String(format: "%.1f", score))")
                    }
                }
            }
        }
    }
}
