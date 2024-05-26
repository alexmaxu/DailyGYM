//
//  ContentView.swift
//  officeStretches
//
//  Created by Alex  on 20/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm = MainViewVM()
    
    let dailyRoutine: String = "Daily Routine"
    let arrayImages: [ImageResource] = [.ejercise1,.ejercise1,.ejercise1,.ejercise1]
    
    
    var body: some View {
        NavigationStack {
            VStack {
                ProfileCell()
                DailyStretches(title: dailyRoutine, image: .ejercise1)
                Spacer()
                ExerciseListScrollView()
                Spacer()
                MyStretches()
                TitleRow(title: "My Exercises")
            }
            .navigationDestination(for: Muscles.self, destination: { muscle in
                MuscleExercisesList(vm: MuscleExerciseVM(muscleTag: muscle))
            
            })
            .navigationDestination(for: Exercise.self, destination: { exercise in
                Text(exercise.workOut)
            })
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.cyan.opacity(0.1), Color.cyan.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
            )
        }
        
    }
}

#Preview {
    ContentView(vm: MainViewVM(exerciseInteractor: PreviewExerciseInteractor()))
}
