//
//  ContentView.swift
//  officeStretches
//
//  Created by Alex  on 20/5/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var profileVM: ProfileVM
    @EnvironmentObject var vm: MainViewVM
    
    @State var showCreateRoutine: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ProfileCell(profile: $profileVM.profile)
                Spacer()
                DailyRoutineCard(dailyRoutine: vm.dailyRoutine)
                Spacer()
                ExerciseListScrollView()
                Spacer()
                MyStretches(arrayStretches: vm.myExercises, showCreateRoutine: $showCreateRoutine)
                TitleRow(title: "History", gradientOpacity: 0.7)
            }
            .navigationDestination(for: Profile.self, destination: { profile in
                ProfileSettingsView()
            })
            .navigationDestination(for: [Exercise].self, destination: { routine in
                ExerciseRoutine(routineExercises: vm.dailyRoutine, exerciseLvl: profileVM.profile.levelSets, title: "Daily Routine", description: "Stay motivated and fit with our daily updated exercise routines. Each day, discover new workouts designed to challenge and energize you, tailored for all fitness levels. Never get bored with your fitness journey. Fresh sets of exercises awaits you every morning!", titleList: "Today's routine")
            })
            .navigationDestination(for: Muscles.self, destination: { muscle in
                    MuscleExercisesList(muscleExerciseListVM: MuscleExerciseListVM(muscleTag: muscle), isPickMode: .noPick)
            })
            .navigationDestination(for: Exercise.self, destination: { exercise in
                ExerciseDetailView(exercise: exercise)
            })
            .navigationDestination(for: MyExerciseModel.self, destination: { myExercise in
                ExerciseRoutine(routineExercises: myExercise.routine, exerciseLvl: profileVM.profile.levelSets, title: myExercise.title, description: myExercise.description ?? "", titleList: myExercise.title + "'s routine")
            })
            .navigationDestination(isPresented: $showCreateRoutine, destination: {
                CreateYourRoutineView()
            })
            .onAppear {
                print("esoty aqui!contetn view")
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
}

#Preview {
    ContentView()
        .environmentObject(ProfileVM())
        .environmentObject(MainViewVM(exerciseInteractor: PreviewExerciseInteractor()))
}
