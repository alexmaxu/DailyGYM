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
    @ObservedObject var MyVM = MyExerciseListToSave()
    
    @State var isPickMode: ListToPickExercise = .noPick
    
    var body: some View {
        NavigationStack {
            VStack {
                ProfileCell(profile: $profileVM.profile)
                Spacer()
                DailyRoutineCard(dailyRoutine: vm.dailyRoutine)
                Spacer()
                ExerciseListScrollView(orientation: .horizontal, isPickMode: $isPickMode)
                Spacer()
                MyStretches(arrayStretches: vm.myExercises)
                TitleRow(title: "History", gradientOpacity: 0.7)
            }
            .onAppear {
                isPickMode = .noPick
            }
            .navigationDestination(for: Profile.self, destination: { profile in
                ProfileSettingsView()
            })
            .navigationDestination(for: [Exercise].self, destination: { routine in
                ExerciseRoutine(routineExercises: vm.dailyRoutine, exerciseLvl: profileVM.profile.levelSets, title: "Daily Routine", description: "Stay motivated and fit with our daily updated exercise routines. Each day, discover new workouts designed to challenge and energize you, tailored for all fitness levels. Never get bored with your fitness journey. Fresh sets of exercises awaits you every morning!", titleList: "Today's routine")
            })
            .navigationDestination(for: Muscles.self, destination: { muscle in
                switch isPickMode {
                case .yesPick:
                    MuscleExercisesList(vm: MuscleExerciseListVM(muscleTag: muscle), MyVM: MyVM, isPickMode: .yesPick)
                case .noPick:
                    MuscleExercisesList(vm: MuscleExerciseListVM(muscleTag: muscle), MyVM: MyVM, isPickMode: .noPick)
                }
                
            })
            .navigationDestination(for: Exercise.self, destination: { exercise in
                ExerciseDetailView(exercise: exercise)
            })
            .navigationDestination(for: MyExerciseModel.self, destination: { myExercise in
                ExerciseRoutine(routineExercises: myExercise.routine, exerciseLvl: profileVM.profile.levelSets, title: myExercise.title, description: myExercise.description ?? "", titleList: myExercise.title + "'s routine")
            })
            .navigationDestination(for: SrcrollOrientation.self, destination: { orientation in
                ExerciseListScrollView(orientation: orientation, isPickMode: $isPickMode)
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
