//
//  myStretches.swift
//  officeStretches
//
//  Created by Alex  on 20/5/24.
//

import SwiftUI

struct MyStretches: View {
    let arrayStretches: [MyExerciseModel]
    @Binding var showCreateRoutine: Bool
    var body: some View {
        TabView {
            ForEach(arrayStretches, id:\.self) { myExercise in
                NavigationLink(value: myExercise) {
                    MyStretchesCard(title: myExercise.title)
                        .swipeActions {
                            Button {
                                print("hola")
                            } label: {
                                Text("hola")
                            }
                        }
                }
            }
            MyStretchesCard(title: "Add new routine")
                .onTapGesture {
                    showCreateRoutine.toggle()
                }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 90)
    }
}

#Preview {
    NavigationStack {
        MyStretches(arrayStretches: [MyExerciseModel(title: "Preview My Exercise Routine", routine: Exercise.previewExercisesList)], showCreateRoutine: .constant(false))
    }
}
