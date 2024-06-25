//
//  HistoryModel.swift
//  officeStretches
//
//  Created by Alex  on 21/6/24.
//

import Foundation

struct HistoryModel: Identifiable {
    var id = UUID()
    
    let title: String
    let day: Date
    let exercises: [Exercise]
}
