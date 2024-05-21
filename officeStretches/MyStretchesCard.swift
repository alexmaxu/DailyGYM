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
                    .padding(.bottom, 24)
                    .frame(maxWidth: .infinity)
                    .frame(height: 90)
            }
            
        }
        
        .background(.cyan.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal)
            
    }
}

#Preview {
    MyStretchesCard(image: .ejercise1, title: "Morning Routine")
}
