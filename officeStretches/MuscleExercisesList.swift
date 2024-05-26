//
//  MuscleExerciseList.swift
//  officeStretches
//
//  Created by Alex  on 25/5/24.
//

import SwiftUI

struct MuscleExercisesList: View {
    
//    var muscle: Muscles
//    
//    @ObservedObject var vm = MuscleExerviseVM(muscleTag: muscle)
//
    
    @ObservedObject var vm : MuscleExerciseVM
    
    init(vm: MuscleExerciseVM) {
        self.vm = vm
    }
    
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
    MuscleExercisesList(vm: MuscleExerciseVM(exerciseInteractor: PreviewExerciseInteractor(), muscleTag: .Biceps))
}
