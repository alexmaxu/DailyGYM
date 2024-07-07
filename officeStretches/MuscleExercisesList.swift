//
//  MuscleExerciseList.swift
//  officeStretches
//
//  Created by Alex  on 25/5/24.
//

import SwiftUI

struct MuscleExercisesList: View {
    
    @EnvironmentObject var vm: MainViewVM
    
    var muscle: Muscles
    
    var body: some View {
            ScrollView {
                VStack {
                    ForEach(vm.exerciseDictionary[muscle] ?? []) { exercise in
                        NavigationLink(value: exercise ) {
                            TitleRow(title: exercise.workOut, gradientOpacity: 0.5)
                                .foregroundStyle(.black)
                        }
                    }
                }
            }
            .searchable(text: $vm.searchText, prompt: "Search")
            .gradientBackground(opacity1: 0.1, opacity2: 0.5)
        }
}

#Preview {
    MuscleExercisesList(muscle: .Biceps)
        .environmentObject(MainViewVM(exerciseInteractor: PreviewExerciseInteractor()))
}
