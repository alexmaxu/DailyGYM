//
//  ExerciseDetailView.swift
//  officeStretches
//
//  Created by Alex  on 27/5/24.
//

import SwiftUI
import WebKit

struct ExerciseDetailView: View {
    let exercise: Exercise
    
    @State var showSheet = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(exercise.workOut)
                    .font(.title2)
                    .bold()
                DetailExerciseInfo(exercise: exercise)
                Text(exercise.explaination)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .background(Color(.gray).opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Image(exercise.muscles.rawValue)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 10)
                    .padding()
                Button(action: {
                    showSheet.toggle()
                }, label: {
                    Text("Video")
                        .font(.headline)
                        .bold()
                        .tint(.black)
                        .frame(width: 90, height: 40)
                        .gradientBackground(opacity1: 0.1, opacity2: 0.7)
                })
                .clipShape(Capsule())
                .padding(.bottom)
                .frame(maxWidth: .infinity)
                Text(exercise.longExplanation)
                    .padding()
                    .background(Color(.gray).opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.horizontal)
            .sheet(isPresented: $showSheet){
                YouTubeView(YTUrl: exercise.video)
                    .ignoresSafeArea()
                    .presentationDetents([.large])
            }
            
        }
        .gradientBackground(opacity1: 0.1, opacity2: 0.5)
    }
}

#Preview {
    ExerciseDetailView(exercise: .previewExercise)
}


