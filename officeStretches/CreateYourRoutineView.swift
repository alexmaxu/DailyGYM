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
    @ObservedObject var muscleExerciseListVM = MuscleExerciseListVM()
    @State var muscle: Muscles = .All
    @State var titleRoutine: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Your Routine:")
                TextField("Title", text: $titleRoutine)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(.horizontal)
            ResumeExerciseRoutineList(routineExercises: $muscleExerciseListVM.myExervisListToSave)
                .frame(height: 200)
            Text("Exercise List")
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
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.cyan.opacity(0.1), Color.cyan.opacity(0.4)]),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        .padding(.horizontal)
                        
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
            
        }
        .toolbar {
            ToolbarItem (placement: .automatic) {
                Button {
                    vm.myExercises.append(MyExerciseModel(title: titleRoutine, routine: muscleExerciseListVM.myExervisListToSave))
                    dismiss()
                } label: {
                    Text("Add routine")
                }
            }
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.cyan.opacity(0.1), Color.cyan.opacity(0.5)]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }
}

#Preview {
    NavigationStack {
        CreateYourRoutineView()
            .environmentObject(MainViewVM(exerciseInteractor: PreviewExerciseInteractor()))
    }
}
