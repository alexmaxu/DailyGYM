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
    
    let dailyRoutine: String = "Daily Routine"
    
    var body: some View {
        NavigationStack {
            VStack {
                ProfileCell(profile: profileVM.profile)
                Spacer()
                DailyStretches(title: dailyRoutine, image: .ejercise1)
                Spacer()
                ExerciseListScrollView()
                Spacer()
                MyStretches()
                TitleRow(title: "History")
            }
            .navigationDestination(for: Muscles.self, destination: { muscle in
                MuscleExercisesList(vm: MuscleExerciseListVM(muscleTag: muscle))
            })
            .navigationDestination(for: Exercise.self, destination: { exercise in
                ExerciseDetailView(exercise: exercise)
            })
            .navigationDestination(for: Profile.self, destination: { profile in
                ProfileSettingsView()
            })
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.cyan.opacity(0.1), Color.cyan.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
            )
        }
    }
}

#Preview {
    ContentView(vm: MainViewVM(exerciseInteractor: PreviewExerciseInteractor()))
        .environmentObject(ProfileVM())
}
