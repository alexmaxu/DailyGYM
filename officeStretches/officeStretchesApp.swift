//
//  officeStretchesApp.swift
//  officeStretches
//
//  Created by Alex  on 20/5/24.
//

import SwiftUI

@main
struct officeStretchesApp: App {
    @StateObject var profileViewModel = ProfileVM()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(profileViewModel)
        }
    }
}
