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
        TitleRow(title: exercise.workOut, gradientOpacity: 0.7)
    }
}

#Preview {
    ExerciseListRow(exercise: .previewExercise)
}
