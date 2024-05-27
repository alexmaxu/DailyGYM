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
                .padding(.vertical)
                Text(exercise.explaination)
                Image(.barbellCurlPng)
                    .resizable()
                    .scaledToFit()
                    .padding()
                VStack (alignment: .center) {
                    Button(action: {
                        showSheet.toggle()
                    }, label: {
                        Text("Video")
                    })
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                Text(exercise.longExplanation)
            }
            .padding(.horizontal)
            .sheet(isPresented: $showSheet){
                YouTubeView(YTUrl: exercise.video)
                    .ignoresSafeArea()
                    .presentationDetents([.large])
            }
        }
    }
}

#Preview {
    ExerciseDetailView(exercise: .previewExercise)
}

struct YouTubeView: UIViewRepresentable {
    let YTUrl: String
    func makeUIView(context: Context) ->  WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let demoURL = URL(string: YTUrl) else { return }
        uiView.load(URLRequest(url: demoURL))
    }
}
