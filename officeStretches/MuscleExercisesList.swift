//
//  MuscleExerciseList.swift
//  officeStretches
//
//  Created by Alex  on 25/5/24.
//

import SwiftUI

struct MuscleExercisesList: View {
    
    @ObservedObject var vm: MuscleExerciseListVM

    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.muscleExercises) { exercise in
                    NavigationLink(value: exercise ) {
                        TitleRow(title: exercise.workOut, gradientOpacity: 0.5)
                            .foregroundStyle(.black)
                    }
                }
            }
        }
        .searchable(text: $vm.searchText, prompt: "Search")
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.cyan.opacity(0.1), Color.cyan.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    MuscleExercisesList(vm: MuscleExerciseListVM(exerciseInteractor: PreviewExerciseInteractor(), muscleTag: .Biceps))
}
