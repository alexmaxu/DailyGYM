//
//  ContentView.swift
//  officeStretches
//
//  Created by Alex  on 20/5/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var profileVM: ProfileVM
    @ObservedObject var vm = MainViewVM()
    
    var body: some View {
        NavigationStack {
            VStack {
                ProfileCell(profile: $profileVM.profile)
                Spacer()
                DailyRoutineCard(dailyRoutine: vm.dailyRoutine)
                Spacer()
                ExerciseListScrollView()
                Spacer()
                MyStretches(arrayStretches: vm.myExercises)
                TitleRow(title: "History", gradientOpacity: 0.7)
            }
            .navigationDestination(for: Profile.self, destination: { profile in
                ProfileSettingsView()
            })
            .navigationDestination(for: [Exercise].self, destination: { routine in
                DailyRoutineView(dailyRoutineExercises: vm.dailyRoutine, exerciseLvl: profileVM.profile.levelSets)
            })
            .navigationDestination(for: Muscles.self, destination: { muscle in
                MuscleExercisesList(vm: MuscleExerciseListVM(muscleTag: muscle))
            })
            .navigationDestination(for: Exercise.self, destination: { exercise in
                ExerciseDetailView(exercise: exercise)
            })
            .navigationDestination(for: MyExerciseModel.self, destination: { myExercise in
                Text("hola")
            })
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.cyan.opacity(0.1), Color.cyan.opacity(0.5)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
    }
}

#Preview {
    ContentView(vm: MainViewVM(exerciseInteractor: PreviewExerciseInteractor()))
        .environmentObject(ProfileVM())
}
