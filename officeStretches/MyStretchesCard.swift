//
//  myStretchesTitle.swift
//  officeStretches
//
//  Created by Alex  on 20/5/24.
//

import SwiftUI

struct MyStretchesCard: View {
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
        
        .gradientBackground(opacity1: 0.1, opacity2: 0.7)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal)
            
    }
}

#Preview {
    MyStretchesCard(title: "Morning Routine")
}
