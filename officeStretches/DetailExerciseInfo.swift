//
//  DetailExerciseInfo.swift
//  officeStretches
//
//  Created by Alex  on 12/6/24.
//

import SwiftUI

struct DetailExerciseInfo: View {
    
    let exercise: Exercise
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(exercise.muscles.rawValue)
                .font(.footnote)
            Text("Exercise LVL: \(exercise.intensityLevel.rawValue)")
                .font(.footnote)
            Text("Beginner sets: \(exercise.beginnerSets.rawValue)")
                .font(.footnote)
            Text("Intermediate sets: \(exercise.intermediateSets.rawValue)")
                .font(.footnote)
            Text("Expert sets: \(exercise.expertSets.rawValue)")
                .font(.footnote)
            Text("Equipment: \(exercise.equipment ?? "No equipment required")")
                .font(.footnote)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.gray).opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    DetailExerciseInfo(exercise: .previewExercise)
}
