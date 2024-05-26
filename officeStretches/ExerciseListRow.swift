//
//  ExerciseListRow.swift
//  officeStretches
//
//  Created by Alex  on 25/5/24.
//

import SwiftUI

struct ExerciseListRow: View {
    let exercise: Exercise
    var body: some View {
        TitleRow(title: exercise.workOut)
    }
}

#Preview {
    ExerciseListRow(exercise: .previewExercise)
}
