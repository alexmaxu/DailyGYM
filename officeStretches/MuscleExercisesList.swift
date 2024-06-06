//
//  MuscleExerciseList.swift
//  officeStretches
//
//  Created by Alex  on 25/5/24.
//

import SwiftUI

struct MuscleExercisesList: View {
    
    @ObservedObject var vm: MuscleExerciseListVM
    @ObservedObject var MyVM: MyExerciseListToSave

    let isPickMode: ListToPickExercise
    
    var body: some View {
        switch isPickMode {
        case .yesPick:
            ScrollView {
                VStack {
                    ForEach(vm.muscleExercises) { exercise in
                        NavigationLink(value: exercise ) {
                            HStack(spacing: 0) {
                                TitleRow(title: exercise.workOut, gradientOpacity: 0.5)
                                Button(action: {
                                    MyVM.myExervisListToSave.append(exercise)
                                }, label: {
                                    TitleRow(title: "add", gradientOpacity: 0.5)
                                        .frame(width: 100)
                                })
                            }
                                .foregroundStyle(.black)
                                .padding(.bottom)
                        }
                    }
                }
            }
            .searchable(text: $vm.searchText, prompt: "Search")
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.cyan.opacity(0.1), Color.cyan.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
            )
        case .noPick:
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
}

#Preview {
    MuscleExercisesList(vm: MuscleExerciseListVM(exerciseInteractor: PreviewExerciseInteractor(), muscleTag: .Biceps),MyVM: MyExerciseListToSave() , isPickMode: .yesPick)
}
