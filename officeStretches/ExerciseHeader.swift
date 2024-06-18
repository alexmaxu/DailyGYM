//
//  ExerciseHeader.swift
//  officeStretches
//
//  Created by Alex  on 13/6/24.
//

import SwiftUI

struct ExerciseHeader: View {
    let exercise: Exercise
    
    var body: some View {
        Text(exercise.workOut)
            .font(.title)
            .bold()
        Image(exercise.muscles.rawValue)
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 10)
            .padding()
        Text(exercise.explaination)
            .padding(.bottom)
    }
}

#Preview {
    ExerciseHeader(exercise: .previewExercise)
}
