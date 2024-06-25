//
//  CongratsView.swift
//  officeStretches
//
//  Created by Alex  on 12/6/24.
//

import SwiftUI

struct CongratsView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var profileVM: ProfileVM
    @EnvironmentObject var vm: MainViewVM
    
    let title: String
    let exercises: [Exercise]
    
    
    var body: some View {
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
                    profileVM.profile.lvl += 0.2
                    vm.addToHistory(title: title, exercises: exercises)
                    dismiss()
                }, label: {
                    Text("See you tomorrow!")
                        .font(.headline)
                        .tint(.black)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .gradientBackground(opacity1: 0.1, opacity2: 0.4)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 3)
                                .fill(.cyan.opacity(1))
                        }
                        .padding(.horizontal)
                    
                })
                .padding(.bottom, 36)
            }
        }
    }
}

#Preview {
    CongratsView(title: "title preview", exercises: Exercise.previewExercisesList)
        
}
