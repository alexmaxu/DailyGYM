//
//  DailyRoutineView.swift
//  officeStretches
//
//  Created by Alex  on 30/5/24.
//

import SwiftUI

struct DailyRoutineView: View {
    @Environment(\.dismiss) var dismiss
    @State var selectedTabIndex = 0
    @State var showSheet = false
    @State var showSheetVideo = false
    
    let dailyRoutineExercises: [Exercise]
    let exerciseLvl: CaseSets
    
    var body: some View {
        TabView (selection: $selectedTabIndex) {
            VStack {
                Text("Daily Routine")
                    .font(.title)
                    .bold()
                Text("Stay motivated and fit with our daily updated exercise routines. Each day, discover new workouts designed to challenge and energize you, tailored for all fitness levels. Never get bored with your fitness journey. Fresh sets of exercises awaits you every morning!")
                    .font(.subheadline)
                    .padding([.horizontal, .bottom])
                Text("Today's routine")
                    .bold()
                Text("30 minutes aproximately")
                    .font(.footnote)
                ScrollView {
                    ForEach(dailyRoutineExercises) { exercise in
                        NavigationLink(value: exercise) {
                            HStack {
                                Spacer()
                                Text(exercise.workOut)
                                    .font(.headline)
                                    .tint(.black)
                                    .padding()
                                Spacer()
                                Image(exercise.muscles.rawValue)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 55)
                                    .clipShape(RoundedRectangle(cornerRadius: 18))
                                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 10)
                                    .padding()
                            }
                            .frame(maxWidth: .infinity)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.cyan.opacity(0.1), Color.cyan.opacity(0.4)]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding(.horizontal)
                        }
                    }
                }
                Button(action: {
                    if selectedTabIndex < dailyRoutineExercises.count {
                        selectedTabIndex += 1
                    }
                }, label: {
                    Text("Ready?")
                        .font(.headline)
                        .tint(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.cyan.opacity(0), Color.cyan.opacity(0.7)]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 3)
                                .fill(.cyan.opacity(1))
                        }
                        .padding(.horizontal)
                })
                Spacer(minLength: 50)
            }
            .tag(0)
            ForEach(dailyRoutineExercises.indices, id: \.self) { index in
                let exercise = dailyRoutineExercises[index]
                DailyRoutineExercise(dailyRoutineExercises: dailyRoutineExercises, exercise: exercise, exerciseLvl: exerciseLvl, selectedTabIndex: $selectedTabIndex, showSheetVideo: $showSheetVideo, showSheet: $showSheet)
                    .tag(index + 1)
                    .padding()
                    .sheet(isPresented: $showSheetVideo, content: {
                        YouTubeView(YTUrl: exercise.video)
                            .ignoresSafeArea()
                            .presentationDetents([.large])
                    })
            }
        }
        .sheet(isPresented: $showSheet) {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.cyan.opacity(0), Color.cyan.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack (alignment: .center) {
                    Spacer()
                    Image(systemName: "hand.thumbsup.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .foregroundColor(.yellow)
                    
                    Text("Congrats!")
                        .font(.title)
                        .bold()
                    Text("Fantastic job completing today's workout! See you tomorrow for another Daily Routine. Keep up the great work, and remember to eat well and rest!")
                        .multilineTextAlignment(.center)
                        .font(.title3)
                        .padding()
                    Spacer()
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("See you tomorrow!")
                            .font(.headline)
                            .tint(.black)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.cyan.opacity(0.1), Color.cyan.opacity(0.4)]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding(.horizontal)
                    })
                    .padding(.bottom, 36)
                }
            }
        }
        .tabViewStyle(.page)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.cyan.opacity(0.1), Color.cyan.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    NavigationStack {
        DailyRoutineView(dailyRoutineExercises: Exercise.previewExercisesList, exerciseLvl: .intermediate)
    }
}
