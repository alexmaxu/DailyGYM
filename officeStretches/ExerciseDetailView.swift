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
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color(.gray).opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                
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
                VStack (alignment: .center) {
                    Button(action: {
                        showSheet.toggle()
                    }, label: {
                        Text("Video")
                    })
                    .clipShape(Capsule())
                }
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
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.cyan.opacity(0.1), Color.cyan.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
        )
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
