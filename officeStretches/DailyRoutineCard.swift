//
//  DailyStretches.swift
//  officeStretches
//
//  Created by Alex  on 20/5/24.
//

import SwiftUI

struct DailyRoutineCard: View {
    let dailyRoutine: [Exercise]
    
    var body: some View {
        NavigationLink (value: dailyRoutine) {
            VStack (spacing: 16){
                Text("Daily Routine")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.black)
                Image(dailyRoutine.first?.muscles.rawValue ?? "mapache")
                    .resizable()
                    .scaledToFill()
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding([.horizontal, .bottom])
                    .shadow(color: .black.opacity(0.4), radius: 5, x: 0, y: 10)
            }
            .frame(maxWidth: .infinity, maxHeight: 420)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
        }
    
    }
}

#Preview {
    DailyRoutineCard(dailyRoutine: [.previewExercise])
}
