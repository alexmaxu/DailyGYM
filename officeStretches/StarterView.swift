//
//  StarterView.swift
//  officeStretches
//
//  Created by Alex  on 15/8/24.
//

import SwiftUI

struct StarterView: View {
    @AppStorage("firstTime") var firstTime = true
    @EnvironmentObject var vmProfile: ProfileVM
    
    var body: some View {
        VStack (alignment: .leading, spacing: 16) {
            Spacer()
            VStack {
                Image(vmProfile.profile.image.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                    .frame(maxWidth: .infinity, alignment: .center)
                Picker("Choose a picture", selection: $vmProfile.profile.image) {
                    ForEach(ProfileImage.allCases) { image in
                        Text(image.rawValue)
                    }
                }
                
                
            }
            Text("Name:")
            TextField("Enter your name", text: $vmProfile.profile.name)
                .textFieldStyle(.roundedBorder)
            HStack {
                Text("Level Sets:")
                Picker("Choose a picture", selection: $vmProfile.profile.levelSets) {
                    ForEach(CaseSets.allCases) { levelSets in
                        switch levelSets {
                        case .beginner: Text("Beginner")
                        case .intermediate: Text("Intermediate")
                        default: Text("Expert")
                        }
                    }
                }
            }
            HStack {
                Spacer()
                Button {
                    vmProfile.saveProfile()
                    firstTime.toggle()
                } label: {
                    DoneLabel(text: "Done")
                }
                Spacer()
            }
            .padding()
            Spacer()
            Spacer()
        }
        .padding()
        
        .gradientBackground(opacity1: 0.1, opacity2: 0.5)
    }
}

#Preview {
    StarterView()
        .environmentObject(ProfileVM())
}
