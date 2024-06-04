//
//  ProfileModel.swift
//  officeStretches
//
//  Created by Alex  on 27/5/24.
//

import Foundation

struct Profile: Hashable {
    var name: String = "No Name"
    var levelSets: CaseSets = .beginner
    var lvl: Int = 0
    var image: ProfileImage = .mapache
}

enum ProfileImage: String, CaseIterable, Identifiable {
    var id: Self { self }
    
    case mapache
    case rana
    case mono
}
