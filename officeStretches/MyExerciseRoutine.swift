//
//  MyExerciseRoutine.swift
//  officeStretches
//
//  Created by Alex  on 18/6/24.
//

import SwiftUI

struct MyExerciseRoutine: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var vm: MainViewVM
    
    @State var selectedTabIndex = 0
    @State var showSheet = false
    @State var showSheetVideo = false
    
    let myExercise: MyExerciseModel
    
    let exerciseLvl: CaseSets
    
    var body: some View {
        TabView (selection: $selectedTabIndex) {
            VStack {
                RoutineIntro(title: myExercise.title, description: myExercise.description ?? "", titleList: myExercise.title + "'s routine", time: myExercise.routine.count * 10)
                ResumeMyExerciseRoutineList(routineExercises: myExercise.routine)
                Button(action: {
                    if selectedTabIndex < myExercise.routine.count {
                        selectedTabIndex += 1
                    }
                }, label: {
                    ReadyLabel(text: "Ready?")
                })
                Spacer(minLength: 50)
            }
            .tag(0)
            ForEach(myExercise.routine.indices, id: \.self) { index in
                let exercise = myExercise.routine[index]
                DailyRoutineExercise(dailyRoutineExercises: myExercise.routine, exercise: exercise, exerciseLvl: exerciseLvl, selectedTabIndex: $selectedTabIndex, showSheetVideo: $showSheetVideo, showSheet: $showSheet)
                    .tag(index + 1)
                    .padding()
                    .sheet(isPresented: $showSheetVideo, content: {
                        YouTubeView(YTUrl: exercise.video)
                            .ignoresSafeArea()
                            .presentationDetents([.large])
                    })
            }
        }
        .toolbar {
            ToolbarItem {
                Button {
                    vm.myExercises.remove(at: vm.myExercises.firstIndex(of: myExercise) ?? 0)
                    dismiss()
                } label: {
                    Text("Remove")
                }
                
            }
        }
        
        .sheet(isPresented: $showSheet) {
            CongratsView(dismiss: _dismiss, title: myExercise.title, exercises: myExercise.routine)
            // Como puedo pasar el dismis de ExerciseRoutine al congrats? para que sirve el "_"
        }
        .tabViewStyle(.page)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .gradientBackground(opacity1: 0.1, opacity2: 0.5)
    }
}

#Preview {
    NavigationStack {
        MyExerciseRoutine(myExercise: .previewMyExerciseModel, exerciseLvl: .expert)
            .environmentObject(MainViewVM(exerciseInteractor: PreviewExerciseInteractor()))
    }
    
}
