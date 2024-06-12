//
//  MuscleExerciseList.swift
//  officeStretches
//
//  Created by Alex  on 25/5/24.
//

import SwiftUI

struct MuscleExercisesList: View {
    @EnvironmentObject var mainVM: MainViewVM
    
    @ObservedObject var muscleExerciseListVM: MuscleExerciseListVM

    let isPickMode: ListToPickExercise
    
    var body: some View {
            ScrollView {
                VStack {
                    ForEach(muscleExerciseListVM.muscleExercises) { exercise in
                        NavigationLink(value: exercise ) {
                            TitleRow(title: exercise.workOut, gradientOpacity: 0.5)
                                .foregroundStyle(.black)
                        }
                    }
                }
            }
            .searchable(text: $muscleExerciseListVM.searchText, prompt: "Search")
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.cyan.opacity(0.1), Color.cyan.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
            )
            .onAppear {
                print("lista de ejercisios")
            }
        }
        
    
}

#Preview {
    MuscleExercisesList(muscleExerciseListVM: MuscleExerciseListVM(exerciseInteractor: PreviewExerciseInteractor(), muscleTag: .Biceps), isPickMode: .yesPick)
        .environmentObject(MainViewVM(exerciseInteractor: PreviewExerciseInteractor()))
}
