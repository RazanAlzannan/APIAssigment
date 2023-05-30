//
//  Vehicle.swift
//  Images
//
//  Created by Razan Mohammed Alzannan on 10/11/1444 AH.
//

import SwiftUI
struct Vehicle: Decodable, Identifiable, Hashable {
    var id: Int
    var uid: String
    var vin: String
    var makeAndModel: String
    var color: String
    var transmission: String
    var driveType: String
    var carType: String
    var carOptions: [String]
    var specs: [String]
    var doors: Int
    var mileage: Int
    var kilometrage: Int
    var licensePlate: String
}

class VehicleViewModel: ObservableObject {

    
    @Published private(set) var vehicle: Vehicle?
    @Published var vehicels: [Vehicle] = []
    init() {
        Task.init {
            await fetchData()
        }
    }
    
    func fetchData() async {
        do {
            guard let url = URL(string: "https://random-data-api.com/api/vehicle/random_vehicle") else { fatalError("Missing URL") }
            
            let urlRequest = URLRequest(url: url)
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(Vehicle.self, from: data)
            
            DispatchQueue.main.async {
                self.vehicle = decodedData
            }
            
            let decoder2 = JSONDecoder()
            decoder2.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData2 = try decoder2.decode([Vehicle].self, from: data)
            
            DispatchQueue.main.async {
                self.vehicels = decodedData2
            }
            
        } catch {
            print("Error fetching data from Pexels: \(error)")
        }
    }
}

struct VehicleView: View {
    @StateObject var VModel = VehicleViewModel()
    
    var body: some View {
        NavigationStack{
            Text("Random Vehicle form API")
                .font(.title2)
                .bold()
            List{
                VStack(spacing: 20) {
                    if let vehicle = VModel.vehicle {
                        Text(vehicle.makeAndModel)
                        Text(vehicle.color)
                        Text(vehicle.carType)
                    }
                    
                }
                
                //               List {
                //                   ForEach(VModel.vehicels, id: \.self) { vm in
                //                       HStack {
                //                           Text(vm.color)
                //                               .bold()
                //                       }.padding(3)
                //                   }
                //               }
            }
            
        }.navigationTitle( "Random Vehicle form AP")
    }
}


struct VehicleView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleView()
    }
}
