//
//  Quotes.swift
//  Images
//
//  Created by Razan Mohammed Alzannan on 10/11/1444 AH.
//

import SwiftUI

struct Quote: Codable {

    var quote: String
    var author: String
}

class BreakingBadViewModel: ObservableObject {
    
    @Published var quotes: [Quote] = []
    
    func fetchQuotes() async{

        guard let url = URL( string: "https://api.breakingbadquotes.xyz/v1/quotes/100")
        else
        { print("ERROR: URL dosn't work!")
            return
        }

        do {
            let (data , _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode( [Quote].self, from: data)
            { quotes = decodedResponse
            }
        }
        catch{
          print("Not valid !")
         }
    }
}


struct Quotes: View {
    @StateObject private var vm = BreakingBadViewModel()
    var body: some View {
        NavigationView {
            List(vm.quotes, id: \.quote) { quote in
                VStack{
                    Text("* \(quote.quote) *")
                        .font(.title3)
                    Text(" Authotor Name : \(quote.author)")
                        .font(.title3)
                }
            }
            .navigationTitle("Quotes")
        }
        .onAppear {
            Task {
                await vm.fetchQuotes()
            }
        }
    }
}

struct Quotes_Previews: PreviewProvider {
    static var previews: some View {
        Quotes()
    }
}
