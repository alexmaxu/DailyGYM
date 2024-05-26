//
//  MuscleExerciseList.swift
//  officeStretches
//
//  Created by Alex  on 25/5/24.
//

import SwiftUI

struct MuscleExercisesList: View {
    
    @ObservedObject var vm = MuscleExerviseVM()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.muscleExercises) { exercise in
                    NavigationLink(value: exercise ) {
                        TitleRow(title: exercise.workOut)
                            .foregroundStyle(.black)
                    }
                }
            }
        }
        .searchable(text: $vm.searchText, prompt: "Search")
    }
}

#Preview {
    MuscleExercisesList(vm: MuscleExerviseVM(exerciseInteractor: PreviewExerciseInteractor()))
}
