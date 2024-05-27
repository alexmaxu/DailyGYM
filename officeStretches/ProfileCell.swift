//
//  ProfileCell.swift
//  officeStretches
//
//  Created by Alex  on 20/5/24.
//

import SwiftUI

struct ProfileCell: View {
    
    var profile: Profile
    
    var body: some View {
        NavigationLink (value: profile) {
            HStack {
                VStack {
                    Text("Alex")
                        .font(.headline)
                        .foregroundStyle(Color.black)
                    Text("LVL: 1")
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
            .background(.cyan.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal)
        }
        
    }
}

#Preview {
    ProfileCell(profile: .previewProfile)
}
