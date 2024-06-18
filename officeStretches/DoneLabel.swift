//
//  DoneLable.swift
//  officeStretches
//
//  Created by Alex  on 13/6/24.
//

import SwiftUI

struct DoneLabel: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title)
            .bold()
            .tint(.black)
            .frame(width: 120, height: 60)
            .gradientBackground(opacity1: 0.1, opacity2: 0.7)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 3)
                    .fill(.cyan.opacity(1))
            }
    }
}

#Preview {
    DoneLabel(text: "Done")
}
