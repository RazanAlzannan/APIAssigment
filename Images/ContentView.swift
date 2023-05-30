//
//  ContentView.swift
//  Images
//
//  Created by Razan Mohammed Alzannan on 09/11/1444 AH.
//

import SwiftUI



struct ContentView: View {
    @State var selectedIndexTab = 0
    var body: some View {
        return VStack {
            
            HStack{
                TabView(selection: $selectedIndexTab) {
                    
                    Courses()
                        .tabItem {
                            Image(systemName: "house.fill")
                                .renderingMode(.template)
                            Text("Courses")
                            
                        }.tag(0)

                    CreaturesView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                                .renderingMode(.template)
                            Text("Pokemon")
                        }.tag(1)


                    VehicleView()
                        .tabItem {
                            Image(systemName: "bell.fill")
                                .renderingMode(.template)
                            Text("Vehicles")
                        }.tag(2)
                    
                    Quotes() .tabItem {
                        Image(systemName: "bell.fill")
                            .renderingMode(.template)
                        Text("Qoutes")
                    }.tag(3)
                    
//                    CoffeeView()
//                        .tabItem {
//                            Image(systemName: "message")
//                                .renderingMode(.template)
//                            Text("Messages")
//                        }.tag(4)
                    
                    
                }
                .accentColor(.blue)
                .toolbarColorScheme(.light, for: .tabBar)
                .background(.white).opacity(40.7)
                
                
            }.ignoresSafeArea()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
