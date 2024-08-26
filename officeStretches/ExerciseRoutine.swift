//
//  DailyRoutineView.swift
//  officeStretches
//
//  Created by Alex  on 30/5/24.
//

import SwiftUI

struct ExerciseRoutine: View {
    @Environment(\.dismiss) var dismiss
    
    @State var selectedTabIndex = 0
    @State var showSheet = false
    @State var showSheetVideo = false
    @State var routineExercises: [Exercise]
    
    let exerciseLvl: CaseSets
    let title: String
    let description: String
    let titleList: String

    var body: some View {
        TabView (selection: $selectedTabIndex) {
            VStack {
                RoutineIntro(title: title, description: description, titleList: titleList, time: routineExercises.count * 10)
                ResumeExerciseRoutineList(routineExercises: $routineExercises)
                Button(action: {
                    if selectedTabIndex < routineExercises.count {
                        selectedTabIndex += 1
                    }
                }, label: {
                    ReadyLabel(text: "Ready?")
                })
                Spacer(minLength: 50)
            }
            .tag(0)
            ForEach(routineExercises.indices, id: \.self) { index in
                let exercise = routineExercises[index]
                DailyRoutineExercise(dailyRoutineExercises: routineExercises, exercise: exercise, exerciseLvl: exerciseLvl, selectedTabIndex: $selectedTabIndex, showSheetVideo: $showSheetVideo, showSheet: $showSheet)
                    .tag(index + 1)
                    .padding()
                    .sheet(isPresented: $showSheetVideo, content: {
                        YouTubeView(YTUrl: exercise.video)
                            .ignoresSafeArea()
                            .presentationDetents([.large])
                    })
            }
        }
        .sheet(isPresented: $showSheet) {
            CongratsView(dismiss: dismiss, title: title, exercises: routineExercises)
        }
        .tabViewStyle(.page)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .gradientBackground(opacity1: 0.1, opacity2: 0.5)
    }
}

#Preview {
    NavigationStack {
        ExerciseRoutine(routineExercises: Exercise.previewExercisesList, exerciseLvl: .intermediate, title: "Daily Routine", description: "Stay motivated and fit with our daily updated exercise routines. Each day, discover new workouts designed to challenge and energize you, tailored for all fitness levels. Never get bored with your fitness journey. Fresh sets of exercises awaits you every morning!", titleList: "Today's routine")
    }
}
