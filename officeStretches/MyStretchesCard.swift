//
//  myStretchesTitle.swift
//  officeStretches
//
//  Created by Alex  on 20/5/24.
//

import SwiftUI

struct MyStretchesCard: View {
    let image: ImageResource
    let title: String
    var body: some View {
        HStack {
            VStack {
                Text(title)
                    .font(.headline)
                    .bold()
                    .tint(.black)
                    .padding(.bottom, 24)
                    .frame(maxWidth: .infinity)
                    .frame(height: 90)
            }
            
        }
        
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.cyan.opacity(0.1), Color.cyan.opacity(0.7)]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal)
            
    }
}

#Preview {
    MyStretchesCard(image: .ejercise1, title: "Morning Routine")
}
