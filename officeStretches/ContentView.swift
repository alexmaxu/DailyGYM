//
//  ContentView.swift
//  officeStretches
//
//  Created by Alex  on 20/5/24.
//

import SwiftUI

struct ContentView: View {
    let dailyRoutine: String = "Daily Routine"
    var body: some View {
        VStack {
            ProfileCell()
            DailyStretches(title: dailyRoutine, image: .ejercise1)
                .padding(.horizontal)
            Spacer()
            
            HistoryCell()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.cyan.opacity(0.2))
        
    }
}

#Preview {
    ContentView()
}
