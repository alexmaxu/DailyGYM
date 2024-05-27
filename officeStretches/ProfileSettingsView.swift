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
            Text("Name:")
            TextField("Name", text: $vm.profile.name)
                .textFieldStyle(.roundedBorder)
            Text("LEVEL: \(vm.profile.lvl)")
            Image(vm.profile.image)
                .resizable()
                .scaledToFit()
                .frame(width: 80)
                .frame(maxWidth: .infinity, alignment: .leading)
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
