//
//  MuscleExerciseList.swift
//  officeStretches
//
//  Created by Alex  on 25/5/24.
//

import SwiftUI

struct MuscleExercisesList: View {
    
    @ObservedObject var muscleExerciseListVM: MuscleExerciseListVM
    
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
            .gradientBackground(opacity1: 0.1, opacity2: 0.5)
        }
}

#Preview {
    MuscleExercisesList(muscleExerciseListVM: MuscleExerciseListVM(exerciseInteractor: PreviewExerciseInteractor(), muscleTag: .Biceps))
        .environmentObject(MainViewVM(exerciseInteractor: PreviewExerciseInteractor()))
}
