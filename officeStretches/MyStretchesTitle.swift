//
//  myStretchesTitle.swift
//  officeStretches
//
//  Created by Alex  on 20/5/24.
//

import SwiftUI

struct MyStretchesTitle: View {
    let image: ImageResource
    let title: String
    var body: some View {
        HStack {
            VStack {
                Text(title)
                    .font(.headline)
                    .bold()
                    .padding(.vertical)
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding([.leading, .trailing, .bottom])
            }
            
            
        }
        .background(.cyan.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal)
            
    }
}

#Preview {
    MyStretchesTitle(image: .ejercise1, title: "Morning Routine")
}
