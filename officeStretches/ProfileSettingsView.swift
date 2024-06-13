//
//  ProfileSettingsView.swift
//  officeStretches
//
//  Created by Alex  on 27/5/24.
//

import SwiftUI

struct ProfileSettingsView: View {
    @EnvironmentObject var vmProfile: ProfileVM
    
    var body: some View {
        VStack (alignment: .leading) {
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
            TextField("Name", text: $vmProfile.profile.name)
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
            Text("LEVEL: \(vmProfile.profile.lvl)")
            HStack {
                Button(action: {
                    vmProfile.profile.lvl += 1
                }, label: {
                    Image(systemName: "plus.circle")
                        .font(.largeTitle)
                })
                .padding(.trailing)
                Button(action: {
                    vmProfile.profile.lvl -= 1
                }, label: {
                    Image(systemName: "minus.circle")
                        .font(.largeTitle)
                })
            }
            .padding()
            Spacer()
        }
        .padding()
        .gradientBackground(opacity1: 0.1, opacity2: 0.5)
    }
}

#Preview {
    ProfileSettingsView()
        .environmentObject(ProfileVM())
}
