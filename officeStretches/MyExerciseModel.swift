//
//  MyExerciseModel.swift
//  officeStretches
//
//  Created by Alex  on 3/6/24.
//

import Foundation

struct MyExerciseModel: Hashable, Codable {
    var title: String
    var description: String?
    var routine: [Exercise]
}
