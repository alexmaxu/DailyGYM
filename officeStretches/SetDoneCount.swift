//
//  SetDoneCount.swift
//  officeStretches
//
//  Created by Alex  on 12/6/24.
//

import SwiftUI

struct SetDoneCount: View {
    
    @Binding var setArray: [Bool]
    
    let exerciseLvl: CaseSets
    let exercise: Exercise
    
    var body: some View {
        switch exerciseLvl {
        case .beginner:
            Text(exercise.beginnerSets.rawValue)
            Text("Count your sets:")
                .font(.footnote)
            VStack {
                HStack {
                    ForEach(0..<3) { index in
                        Button {
                            setArray[index].toggle()
                        } label: {
                            Text("Set Done")
                                .font(.headline)
                                .bold()
                                .tint(.black)
                                .frame(width: 70, height: 60)
                                .gradientBackground(opacity1: 0.1, opacity2: 0.7)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .opacity(setArray[index] ? 1.0 : 0.2)
                        }
                    }
                }
            }
        case .intermediate:
            Text(exercise.intermediateSets.rawValue)
            Text("Count your sets:")
            VStack {
                HStack {
                    ForEach(0..<4) { index in
                        Button {
                            setArray[index].toggle()
                        } label: {
                            Text("Set Done")
                                .font(.headline)
                                .bold()
                                .tint(.black)
                                .frame(width: 70, height: 60)
                                .gradientBackground(opacity1: 0.1, opacity2: 0.7)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .opacity(setArray[index] ? 1.0 : 0.2)
                        }
                    }
                }
            }
        case .expert:
            Text(exercise.expertSets.rawValue)
            Text("Count your sets:")
            VStack {
                HStack {
                    ForEach(0..<5) { index in
                        Button {
                            setArray[index].toggle()
                        } label: {
                            Text("Set Done")
                                .font(.headline)
                                .bold()
                                .tint(.black)
                                .frame(width: 70, height: 60)
                                .gradientBackground(opacity1: 0.1, opacity2: 0.7)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .opacity(setArray[index] ? 1.0 : 0.3)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(lineWidth: 3)
                                        .fill(.cyan.opacity(1))
                                }
                        }
                    }
                }
            }
        }

    }
}

#Preview {
    SetDoneCount(setArray: .constant([false, false, false, false, false]), exerciseLvl: .beginner, exercise: .previewExercise)
}
