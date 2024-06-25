//
//  ExerciseModel.swift
//  officeStretches
//
//  Created by Alex  on 21/5/24.
//

import Foundation

struct Exercise: Codable, Identifiable, Hashable{
    let id = UUID()
    let muscles: Muscles
    let workOut: String
    let intensityLevel: IntensityLevel
    let beginnerSets: BeginnerSets
    let intermediateSets: IntermediateSets
    let expertSets: ExpertSets
    let equipment: String?
    let explaination, longExplanation: String
    let video: String
    
    enum CodingKeys: String, CodingKey {
        case muscles = "Muscles"
        case workOut = "WorkOut"
        case intensityLevel = "Intensity_Level"
        case beginnerSets = "Beginner Sets"
        case intermediateSets = "Intermediate Sets"
        case expertSets = "Expert Sets"
        case equipment = "Equipment"
        case explaination = "Explaination"
        case longExplanation = "Long Explanation"
        case video = "Video"
    }
}

enum CaseSets: String, CaseIterable, Identifiable, Codable {
    var id: Self { self }
    case beginner = "3 Sets with 12 to 15 reps"
    case intermediate = "4 Sets with 8 to 12 reps"
    case expert = "5 Sets with 3 to 10 reps"
}

enum BeginnerSets: String, Codable {
    case the3SetsWith12To15Reps = "3 Sets with 12 to 15 reps"
}

enum ExpertSets: String, Codable {
    case the5SetsWith3To10Reps = "5 Sets with 3 to 10 reps"
}

enum IntensityLevel: String, Codable {
    case beginner = "Beginner"
    case expert = "Expert"
    case intermediate = "Intermediate"
}

enum IntermediateSets: String, Codable {
    case the4SetsWith8To12Reps = "4 Sets with 8 to 12 reps"
}
 
enum Muscles: String, Codable, CaseIterable, Identifiable, Hashable {
    var id: Self {self}
    
    case Biceps
    case Triceps
    case Chest
    case Back
    case Legs
    case Abs
    case Stretching
    case WarmUp = "Warm Up"
    case Lats
    case Hamstring
    case Calves
    case Quadriceps
    case Trapezius
    case Shoulders
    case Glutes
    case All = ""
}
