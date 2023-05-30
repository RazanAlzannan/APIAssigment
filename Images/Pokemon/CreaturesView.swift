//
//  CreaturesView.swift
//  Images
//
//  Created by Razan Mohammed Alzannan on 10/11/1444 AH.
//

import SwiftUI

struct CreaturesView: View {
    var creaturesVM = CreaturesViewModel()
    var body: some View {
            NavigationStack{
                List(creaturesVM.creaturesArray , id: \.self) {
                    creature in
                    Text(creature.name)
                        .font(.title2)
                }
                .listStyle(.plain)
                .navigationTitle("Pokemon")
            }
            .task{
                await creaturesVM.getData()
            }
        }
    }


struct CreaturesView_Previews: PreviewProvider {
    static var previews: some View {
        CreaturesView()
    }
}
