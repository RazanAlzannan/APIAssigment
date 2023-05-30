//
//  Coffee.swift
//  Images
//
//  Created by Razan Mohammed Alzannan on 10/11/1444 AH.
//

import SwiftUI
//struct CoffeeItem : Hashable, Codable {
//    var file : String
//}
//func load<T: Decodable>(_ filename: String) -> T {
//    let data: Data
//// Create URL
//    guard let file = Bundle.main.url(forResource: filename, withExtension: "json")
//        else {
//            fatalError("Couldn't find \(filename) in main bundle.")
//    }
//// load data from the JSON
//    do {
//        data = try Data(contentsOf: file)
//    } catch {
//        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
//    }
//// Decode Data
//    do {
//        let decoder = JSONDecoder()
//        return try decoder.decode(T.self, from: data)
//    } catch {
//        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//    }
//
//
//}

struct Coffee: View {
    var body: some View {
        VStack{
            
        }
    }
}

func loadDate (){
    // creat url
    
}


struct Coffee_Previews: PreviewProvider {
    static var previews: some View {
        Coffee()
    }
}
