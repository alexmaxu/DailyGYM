//
//  URL.swift
//  officeStretches
//
//  Created by Alex  on 21/5/24.
//

import Foundation

let mainURL = URL(string: "https://work-out-api1.p.rapidapi.com")!

extension URL {
    static let getExerciseURL = mainURL.appending(path: "search")
}
