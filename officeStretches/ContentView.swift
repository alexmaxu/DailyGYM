//
//  ContentView.swift
//  officeStretches
//
//  Created by Alex  on 20/5/24.
//

import SwiftUI

struct ContentView: View {
    let dailyRoutine: String = "Daily Routine"
    let arrayImages: [ImageResource] = [.ejercise1,.ejercise1,.ejercise1,.ejercise1]
    var body: some View {
        VStack {
            ProfileCell()
            DailyStretches(title: dailyRoutine, image: .ejercise1)
            Spacer()
            ScrollView(.horizontal) {
                HStack {
                    ForEach(arrayImages, id:\.self) { card in
                        VStack {
                            Text("Title Exercise")
                                .padding(.top)
                            Image(card)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding([.bottom, .horizontal])
                        }
                        .background(Color.cyan.opacity(0.3))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.top)
                        
                    }
                    
                }
                
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
            Spacer()
            MyStretches()
            Spacer()
            HistoryCell()
            
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.cyan.opacity(0.2), Color.cyan.opacity(0.4)]), startPoint: .top, endPoint: .bottom)
        )
        
    }
}

#Preview {
    ContentView()
}
