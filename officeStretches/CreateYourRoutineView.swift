//
//  CreateYourRoutineView.swift
//  officeStretches
//
//  Created by Alex  on 7/6/24.
//

import SwiftUI

struct CreateYourRoutineView: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var vm: MainViewVM
    
    @State var titleRoutine: String = ""
    
    var body: some View {
        VStack {
            Text("Routine's name:")
            TextField("Title", text: $titleRoutine)
                .textFieldStyle(.roundedBorder)
            ResumeExerciseRoutineList(routineExercises: $vm.myExervisListToSave)
                .frame(height: 200)
            Text("Exercises:")
                .font(.title3)
                .bold()
            ScrollView {
                VStack {
                    ForEach(Muscles.allCases.dropLast()) { muscle in
                        DisclosureGroup {
                            ForEach(vm.exerciseDictionary[muscle] ?? []) { exercise in
                                Button {
                                    vm.myExervisListToSave.append(exercise)
                                    print("le doy al botn")
                                } label: {
                                    HStack {
                                        Text(exercise.workOut)
                                            .foregroundStyle(Color.black)
                                    }
                                    Spacer()
                                    Image(exercise.muscles.rawValue)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 120, height: 60)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                    Image(systemName: "plus.circle")
                                        .font(.title)
                                }
                                
                            }
                        } label: {
                            Text(muscle.rawValue)
                                .bold()
                                .tint(Color.black)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .gradientBackground(opacity1: 0.1, opacity2: 0.4)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
        }
        .padding(.horizontal)
        .toolbar {
            ToolbarItem (placement: .automatic) {
                Button {
                    if !vm.myExervisListToSave.isEmpty {
                        vm.addToMyExercises(titleRoutine: titleRoutine, routine: vm.myExervisListToSave)
                        dismiss()
                    } else {
                        // crear una pantallita de alerta.
                    }
                    
                } label: {
                    Text("Add routine")
                }
            }
        }
        .gradientBackground(opacity1: 0.1, opacity2: 0.5)
    }
}

#Preview {
    NavigationStack {
        CreateYourRoutineView()
            .environmentObject(MainViewVM(exerciseInteractor: PreviewExerciseInteractor()))
    }
}
