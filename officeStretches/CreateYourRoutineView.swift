//
//  CreateYourRoutineView.swift
//  officeStretches
//
//  Created by Alex  on 7/6/24.
//

import SwiftUI

struct CreateYourRoutineView: View {
    @Environment(\.dismiss) var dismiss
    
    // Tiene los datos generales de la app del ContentView
    @EnvironmentObject var vm: MainViewVM
    
    // Este view Model se encarga de cargar los ejercicios
    @ObservedObject var muscleExerciseListVM = MuscleExerciseListVM()
    
    @State var titleRoutine: String = ""
    
    var body: some View {
        VStack {
            Text("Routine's name:")
            TextField("Title", text: $titleRoutine)
                .textFieldStyle(.roundedBorder)
                
            ResumeExerciseRoutineList(routineExercises: $muscleExerciseListVM.myExervisListToSave)
                .frame(height: 200)
            Text("Exercises:")
                .font(.title3)
                .bold()
            ScrollView {
                VStack {
                    ForEach(Muscles.allCases.dropLast()) { muscle in
                        DisclosureGroup {
                            ForEach(muscleExerciseListVM.exerciseDictionary[muscle] ?? []) { exercise in
                                HStack {
                                    Text(exercise.workOut)
                                    Spacer()
                                    Image(exercise.muscles.rawValue)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100)
                                    Button {
                                        muscleExerciseListVM.myExervisListToSave.append(exercise)
                                        print("le doy al botn")
                                    } label: {
                                        Text("Add")
                                    }
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
                    vm.addToMyExercises(titleRoutine: titleRoutine, routine: muscleExerciseListVM.myExervisListToSave)
                    dismiss()
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
