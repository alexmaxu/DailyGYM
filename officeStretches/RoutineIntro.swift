//
//  RoutineIntro.swift
//  officeStretches
//
//  Created by Alex  on 13/6/24.
//

import SwiftUI

struct RoutineIntro: View {
    
    let title: String
    let description: String
    let titleList: String
    let time: Int
    
    var body: some View {
        Text(title)
            .font(.title)
            .bold()
        Text(description)
            .font(.subheadline)
            .padding([.horizontal, .bottom])
        Text(titleList)
            .bold()
        Text("\(time) minutes aproximately")
            .font(.footnote)
    }
}

#Preview {
    RoutineIntro(title: "Monday", description: "Stay motivated and fit with our daily updated exercise routines. Each day, discover new workouts designed to challenge and energize you, tailored for all fitness levels. Never get bored with your fitness journey. Fresh sets of exercises awaits you every morning!", titleList: "Today's routine", time: 30)
}
