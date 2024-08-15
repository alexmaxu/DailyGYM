//
//  officeStretchesApp.swift
//  officeStretches
//
//  Created by Alex  on 20/5/24.
//

import SwiftUI

@main
 struct officeStretchesApp: App {
     @AppStorage("firstTime") var firstTime = true
     @StateObject var profileViewModel = ProfileVM()
     @StateObject var mainVM = MainViewVM()
    
    var body: some Scene {
        WindowGroup {
            if firstTime {
                StarterView()
                    .environmentObject(profileViewModel)
            } else {
                ContentView()
                    .environmentObject(profileViewModel)
                    .environmentObject(mainVM)
            }
            
        }
    }
}
