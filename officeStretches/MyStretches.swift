//
//  myStretches.swift
//  officeStretches
//
//  Created by Alex  on 20/5/24.
//

import SwiftUI

struct MyStretches: View {
    let arrayStretches: [MyExerciseModel]
    var body: some View {
        TabView {
            ForEach(arrayStretches, id:\.self) { myExercise in
                NavigationLink(value: myExercise) {
                    MyStretchesCard(image: .ejercise1, title: myExercise.title)
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 90)
    }
}

#Preview {
    MyStretches(arrayStretches: [MyExerciseModel(title: "Preview My Exercise Routine", routine: Exercise.previewExercisesList)])
}
