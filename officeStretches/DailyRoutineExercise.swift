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
            switch exerciseLvl {
            case .beginner:
                Text(exercise.beginnerSets.rawValue)
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
                                    .background(
                                        LinearGradient(
                                            gradient: Gradient(colors: [Color.cyan.opacity(0.1), Color.cyan.opacity(0.7)]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                    )
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .opacity(setArray[index] ? 1.0 : 0.2)
                            }
                        }
                        
                        
                        
                    }
                }
            case .intermediate:
                Text(exercise.intermediateSets.rawValue)
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
                                    .background(
                                        LinearGradient(
                                            gradient: Gradient(colors: [Color.cyan.opacity(0.1), Color.cyan.opacity(0.7)]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                    )
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .opacity(setArray[index] ? 1.0 : 0.2)
                            }
                        }
                        
                        
                        
                    }
                }
            case .expert:
                Text(exercise.expertSets.rawValue)
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
                                    .background(
                                        LinearGradient(
                                            gradient: Gradient(colors: [Color.cyan.opacity(0.1), Color.cyan.opacity(0.7)]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                    )
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .opacity(setArray[index] ? 1.0 : 0.2)
                            }
                        }
                        
                        
                        
                    }
                }
            }
            Spacer()
            Button(action: {
                showSheetVideo.toggle()
            }, label: {
                Text("Video")
                    .font(.headline)
                    .bold()
                    .tint(.black)
                    .frame(width: 90, height: 40)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.cyan.opacity(0.1), Color.cyan.opacity(0.7)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            })
            Spacer()
            Button {
                if selectedTabIndex < dailyRoutineExercises.count {
                    selectedTabIndex += 1
                } else {
                    showSheet.toggle()
                }
            } label: {
                Text("Done")
                    .font(.title)
                    .bold()
                    .tint(.black)
                    .frame(width: 120, height: 60)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.cyan.opacity(0.1), Color.cyan.opacity(0.7)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 3)
                            .fill(.cyan.opacity(1))
                    }
            }
            .padding(.bottom, 32)
        }
    }
}

#Preview {
    DailyRoutineExercise(dailyRoutineExercises: Exercise.previewExercisesList, exercise: .previewExercise, exerciseLvl: .expert, selectedTabIndex: .constant(Int()), showSheetVideo: .constant(Bool()), showSheet: .constant(Bool()))
}
