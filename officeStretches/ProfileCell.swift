//
//  ProfileCell.swift
//  officeStretches
//
//  Created by Alex  on 20/5/24.
//

import SwiftUI

struct ProfileCell: View {
    var body: some View {
        HStack {
            
            VStack {
                Text("Alex")
                    .font(.headline)
                Text("LVL: 1")
                    .font(.footnote)
            }
            .padding()
            Spacer()
            Image(.mapache)
                .resizable()
                .scaledToFit()
                .frame(width: 70)
                .padding()
            
        }
        .frame(height: 70)
        .background(.cyan.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal)
    }
}

#Preview {
    ProfileCell()
}
