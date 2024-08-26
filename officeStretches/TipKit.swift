//
//  TipKit.swift
//  officeStretches
//
//  Created by Alex  on 26/8/24.
//

import Foundation
import TipKit

struct ProfileTip: Tip {
    var title: Text {
        Text("Check your profile")
    }
    
    var message: Text? {
        Text("You can change your configuration.")
    }
    
    var image: Image? {
        Image(systemName: "person.crop.circle")
    }
}

struct CreateNewRoutine: Tip {
    static let createRoutineEvent = Event(id: "newRoutine")
    static let mainViewVisitedEvent = Event(id: "mainViewVisited")
    
    var title: Text {
        Text("Create new routine")
    }
    
    var message: Text? {
        Text("Custom your own routine")
    }
    
    var image: Image? {
        Image(systemName: "dumbbell.fill")
    }
    
    var rules: [Rule] {
        
        #Rule(Self.createRoutineEvent) { event in
            event.donations.count == 0
        }
        
        #Rule(Self.mainViewVisitedEvent) { event in
            event.donations.count > 2 
        }
    }
    
}
