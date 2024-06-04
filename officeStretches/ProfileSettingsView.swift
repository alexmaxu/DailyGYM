//
//  ProfileSettingsView.swift
//  officeStretches
//
//  Created by Alex  on 27/5/24.
//

import SwiftUI

struct ProfileSettingsView: View {
    @EnvironmentObject var vm: ProfileVM
    var body: some View {
        VStack (alignment: .leading) {
            VStack {
                Image(vm.profile.image.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                    .frame(maxWidth: .infinity, alignment: .center)
                Picker("Choose a picture", selection: $vm.profile.image) {
                    ForEach(ProfileImage.allCases) { image in
                        Text(image.rawValue)
                    }
                }
            }
            Text("Name:")
            TextField("Name", text: $vm.profile.name)
                .textFieldStyle(.roundedBorder)
            HStack {
                Text("Level Sets:")
                Picker("Choose a picture", selection: $vm.profile.levelSets) {
                    ForEach(CaseSets.allCases) { levelSets in
                        switch levelSets {
                        case .beginner: Text("Beginner")
                        case .intermediate: Text("Intermediate")
                        default: Text("Expert")
                        }
                    }
                }
            }
            Text("LEVEL: \(vm.profile.lvl)")
            HStack {
                Button(action: {
                    vm.profile.lvl += 1
                }, label: {
                    Image(systemName: "plus.circle")
                        .font(.largeTitle)
                })
                .padding(.trailing)
                Button(action: {
                    vm.profile.lvl -= 1
                }, label: {
                    Image(systemName: "minus.circle")
                        .font(.largeTitle)
                })
            }
            
            .padding()
            Spacer()
        }
        .padding()
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.cyan.opacity(0.1), Color.cyan.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    ProfileSettingsView()
        .environmentObject(ProfileVM())
}
