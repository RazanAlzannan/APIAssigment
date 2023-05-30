//
//  Courses.swift
//  Images
//
//  Created by Razan Mohammed Alzannan on 10/11/1444 AH.
//

import SwiftUI

struct Course: Hashable, Codable {
let name: String
let image: String
}

class ViewModel: ObservableObject {
    
    @Published var courses: [Course] = []
    
    func fetch() {
        guard let url = URL (string: "https://iosacademy.io/api/v1/courses/index.php") else {
            return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self]
            data, _, error in
            guard let data = data, error == nil else {
                return
            }
            //convert to json
            
            do {
                let courses = try JSONDecoder().decode([Course].self, from: data)
                DispatchQueue.main.async {
                    self?.courses = courses
                }
            }
            catch {
                print(error)
            }// catch
        }
        task.resume()
    }// func
}

struct Courses: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(viewModel.courses, id: \.self) { course in
                        HStack {
                            Image("")
                            frame(width: 130, height: 70)
                                .background(Color.gray)
                            Text(course.name)
                                .bold()
                        }.padding(3)
                    }
                }
            }.navigationTitle("Courses")
                .onAppear {
                    viewModel.fetch()
                }
            
        }
    }
}

struct Courses_Previews: PreviewProvider {
    static var previews: some View {
        Courses()
    }
}
