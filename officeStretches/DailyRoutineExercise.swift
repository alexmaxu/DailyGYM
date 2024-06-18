//
//  DailyRoutineExercise.swift
//  officeStretches
//
//  Created by Alex  on 4/6/24.
//

import SwiftUI

struct DailyRoutineExercise: View {
    
    let dailyRoutineExercises: [Exercise]
    let exercise: Exercise
    let exerciseLvl: CaseSets
    
    @Binding var selectedTabIndex: Int
    @Binding var showSheetVideo: Bool
    @Binding var showSheet: Bool
    
    @State var setArray: [Bool] = [false, false, false, false, false]
    
    var body: some View {
        VStack {
            ExerciseHeader(exercise: exercise)
            SetDoneCount(setArray: $setArray, exerciseLvl: exerciseLvl, exercise: exercise)
            Spacer()
            Button(action: {
                showSheetVideo.toggle()
            }, label: {
                VideoLabel(text: "Video")
            })
            Spacer()
            Button {
                if selectedTabIndex < dailyRoutineExercises.count {
                    selectedTabIndex += 1
                } else {
                    showSheet.toggle()
                }
            } label: {
                DoneLabel(text: "Done")
            }
            .padding(.bottom, 32)
        }
    }
}

#Preview {
    DailyRoutineExercise(dailyRoutineExercises: Exercise.previewExercisesList, exercise: .previewExercise, exerciseLvl: .expert, selectedTabIndex: .constant(Int()), showSheetVideo: .constant(Bool()), showSheet: .constant(Bool()))
}
