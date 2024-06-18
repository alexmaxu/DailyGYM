//
//  ReadyLable.swift
//  officeStretches
//
//  Created by Alex  on 13/6/24.
//

import SwiftUI

struct ReadyLabel: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.headline)
            .tint(.black)
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .gradientBackground(opacity1: 0.0, opacity2: 0.7)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 3)
                    .fill(.cyan.opacity(1))
            }
            .padding(.horizontal)
    }
}

#Preview {
    ReadyLabel(text: "Ready?")
}
