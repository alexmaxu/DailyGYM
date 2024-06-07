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
     @StateObject var mainVM = MainViewVM()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(profileViewModel)
                .environmentObject(mainVM)
        }
    }
}
