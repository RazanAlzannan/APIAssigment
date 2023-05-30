//
//  CreaturesViewModel.swift
//  Images
//
//  Created by Razan Mohammed Alzannan on 10/11/1444 AH.
//

import Foundation

class CreaturesViewModel : ObservableObject{
    
    
    private struct Returned: Codable {
        var count: Int
        var next: String
        var results: [Result]
    }
    
    struct Result: Codable, Hashable {
        var name: String
        var url: String // url for detail on Pokemon
    }
    
    @Published var count = 0
    @Published var urlString = "http://pokeapi.co/api/v2/pokemon/"
    @Published var creaturesArray: [Result] = []
    func getData() async {
        print (" We are accessing the url \(urlString)")
        // Convert string to url
        guard let url = URL (string: urlString) else {
            print (" ERROR: Could not create a URL from \(urlString)")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            // Try to decode JSON data into our own data struct
            guard let returned = try? JSONDecoder().decode(Returned.self, from: data) else {
                print ("JSON ERROR: Could not decode returned JSON data")
                return
            }
            self.count = returned.count
            self.urlString = returned.next
            self.creaturesArray = returned.results
        } catch {
            print ("ERROR: Could not user URL at \(urlString) to get data and response")
        }
    }
}

