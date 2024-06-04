//
//  ProfileCell.swift
//  officeStretches
//
//  Created by Alex  on 20/5/24.
//

import SwiftUI

struct ProfileCell: View {
    
    @Binding var profile: Profile
    
    var body: some View {
        NavigationLink (value: profile) {
            HStack {
                VStack(alignment: .leading) {
                    Text(profile.name)
                        .font(.headline)
                        .foregroundStyle(Color.black)
                    Text("LVL: \(profile.lvl)")
                        .font(.footnote)
                        .foregroundStyle(Color.black)
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
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.cyan.opacity(0.1), Color.cyan.opacity(0.4)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal)
        }
        
    }
}

#Preview {
    ProfileCell(profile: .constant(Profile()))
}
