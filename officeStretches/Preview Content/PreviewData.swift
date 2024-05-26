//
//  PreviewData.swift
//  officeStretches
//
//  Created by Alex  on 22/5/24.
//

import Foundation

struct PreviewExerciseInteractor: ExerciseInteractorProtocol {
    func fetchExercises(muscle: Muscles) async throws -> [Exercise] {
        let url = Bundle.main.url(forResource: "ExerciseList", withExtension: "json")!
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([Exercise].self, from: data)
    }
}

extension Exercise {
    static let previewExercise = Exercise(muscles: .Biceps, workOut: "Preview Barbell Curl", intensityLevel: .beginner, beginnerSets: .the3SetsWith12To15Reps, intermediateSets: .the4SetsWith8To12Reps, expertSets: .the5SetsWith3To10Reps, equipment: "Barbell", explaination: "Barbell Curl: Stand with feet shoulder-width apart, hold a barbell with an underhand grip and curl it towards your shoulders.", longExplanation: "This classic bicep-building exercise involves standing with feet shoulder-width apart, gripping a barbell with an underhand grip. With elbows close to the torso, curl the barbell towards the shoulders while keeping the upper arms stationary. This motion targets the bicep muscles, including both the long and short head, providing development in muscle mass and arm strength. The focus is on smooth, controlled movements, exhaling as you lift the barbell and inhaling on the return. For beginners, it's crucial to start with a lighter weight to perfect the form before progressing.", video: "https://www.youtube.com/results?search_query=Barbell+Curl")
}
