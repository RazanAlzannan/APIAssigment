//
//  Vehicle.swift
//  Images
//
//  Created by Razan Mohammed Alzannan on 10/11/1444 AH.
//

import SwiftUI
struct Vehicle: Decodable, Identifiable {
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

struct Vehicle: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Vehicle_Previews: PreviewProvider {
    static var previews: some View {
        Vehicle()
    }
}
