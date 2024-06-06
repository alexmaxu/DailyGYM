//
//  ExerciseListScrollView.swift
//  officeStretches
//
//  Created by Alex  on 21/5/24.
//

import SwiftUI

struct ExerciseListScrollView: View {
    let orientation: SrcrollOrientation
    @Binding var isPickMode: ListToPickExercise
    
    var body: some View {
        switch orientation {
        case .vertical:
            ScrollView {
                VStack {
                    ForEach(Muscles.allCases) { muscle in
                        NavigationLink(value: muscle) {
                            VStack {
                                Text(muscle.rawValue)
                                    .bold()
                                    .foregroundStyle(.black)
                                Image(muscle.rawValue)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 200, height: 130)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .padding([.bottom, .horizontal])
                                    .shadow(color: .black.opacity(0.4), radius: 5, x: 0, y: 10)
                            }
                        }
                    }
                }
                .onAppear {
                    isPickMode = .yesPick
                }
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
        case .horizontal:
            ScrollView(.horizontal) {
                HStack {
                    ForEach(Muscles.allCases) { muscle in
                        NavigationLink(value: muscle) {
                            VStack {
                                Text(muscle.rawValue)
                                    .bold()
                                    .foregroundStyle(.black)
                                Image(muscle.rawValue)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 200, height: 130)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .padding([.bottom, .horizontal])
                                    .shadow(color: .black.opacity(0.4), radius: 5, x: 0, y: 10)
                            }                       .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
        }
        
    }
}

#Preview {
    NavigationStack {
        ExerciseListScrollView(orientation: .vertical, isPickMode: .constant(ListToPickExercise.noPick))
    }
}
