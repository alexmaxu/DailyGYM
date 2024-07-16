//
//  LoadingView.swift
//  officeStretches
//
//  Created by Alex  on 15/7/24.
//

import SwiftUI

struct LoadingView: View {
    let textIntro: [String] = [
        "Remember: consistency is key to a healthy and active life. Keep moving and stay committed to your fitness journey every day!",
        "Health and wellness are built day by day. Stay consistent and active to achieve your goals and enjoy a better quality of life!",
        "A little bit of exercise each day makes a big difference. Be consistent, stay active, and take care of your health for a brighter future!"
                            ]
    var body: some View {
        ZStack {
            VStack {
                Image("StepUp")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .padding()
                Text(textIntro.randomElement() ?? "")
                    .padding()
                ProgressView()
                    .controlSize(.extraLarge)
                    .padding()
            }
            .frame(maxHeight: .infinity)
            .gradientBackground(opacity1: 0.1, opacity2: 0.9)
            .background {
                Color.white
            }
        }
    }
}

#Preview {
    LoadingView()
}
