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

extension Profile {
    static var previewProfile = Profile(name: "Preview Alex", levelSets: .beginner, lvl: 121, image: .mapache )
}

extension Exercise {
    static let previewExercise = Exercise(
        muscles: .Biceps,
        workOut: "Preview Barbell Curl",
        intensityLevel: .beginner,
        beginnerSets: .the3SetsWith12To15Reps,
        intermediateSets: .the4SetsWith8To12Reps,
        expertSets: .the5SetsWith3To10Reps,
        equipment: "Barbell",
        explaination: "Barbell Curl: Stand with feet shoulder-width apart, hold a barbell with an underhand grip and curl it towards your shoulders.",
        longExplanation: "This classic bicep-building exercise involves standing with feet shoulder-width apart, gripping a barbell with an underhand grip. With elbows close to the torso, curl the barbell towards the shoulders while keeping the upper arms stationary. This motion targets the bicep muscles, including both the long and short head, providing development in muscle mass and arm strength. The focus is on smooth, controlled movements, exhaling as you lift the barbell and inhaling on the return. For beginners, it's crucial to start with a lighter weight to perfect the form before progressing.",
        video: "https://www.youtube.com/results?search_query=Barbell+Curl"
    )
    
    static let previewExercisesList = [
        Exercise(
            muscles: .Biceps,
            workOut: "Preview Barbell Curl",
            intensityLevel: .beginner,
            beginnerSets: .the3SetsWith12To15Reps,
            intermediateSets: .the4SetsWith8To12Reps,
            expertSets: .the5SetsWith3To10Reps,
            equipment: "Barbell",
            explaination: "Barbell Curl: Stand with feet shoulder-width apart, hold a barbell with an underhand grip and curl it towards your shoulders.",
            longExplanation: "This classic bicep-building exercise involves standing with feet shoulder-width apart, gripping a barbell with an underhand grip. With elbows close to the torso, curl the barbell towards the shoulders while keeping the upper arms stationary. This motion targets the bicep muscles, including both the long and short head, providing development in muscle mass and arm strength. The focus is on smooth, controlled movements, exhaling as you lift the barbell and inhaling on the return. For beginners, it's crucial to start with a lighter weight to perfect the form before progressing.",
            video: "https://www.youtube.com/results?search_query=Barbell+Curl"
        ),
        Exercise(
            muscles: .Chest,
            workOut: "Pec Deck Machine",
            intensityLevel: .expert,
            beginnerSets: .the3SetsWith12To15Reps,
            intermediateSets: .the4SetsWith8To12Reps,
            expertSets: .the5SetsWith3To10Reps,
            equipment: nil,
            explaination: "Pec Deck Machine: Sit with arms on the pads and bring them together in front of you.",
            longExplanation: "The Pec Deck Machine is a weight training exercise targeting the Chest. It involves using Pec deck machine, focusing on the form and technique to effectively engage the muscles. Ideal for strength building and muscle definition, it's important to maintain controlled movements throughout.",
            video: "https://www.youtube.com/results?search_query=Pec+Deck+Machine"
        ),
        Exercise(
            muscles: .Back,
            workOut: "Chin-Up",
            intensityLevel: .expert,
            beginnerSets: .the3SetsWith12To15Reps,
            intermediateSets: .the4SetsWith8To12Reps,
            expertSets: .the5SetsWith3To10Reps,
            equipment: nil,
            explaination: "Chin-Up: Grip a bar with palms facing towards you and pull up until your chin is over the bar, focusing on your upper back.",
            longExplanation: "The Chin-Up is a weight training exercise targeting the Back. It involves using Pull-up bar, focusing on the form and technique to effectively engage the muscles. Ideal for strength building and muscle definition, it's important to maintain controlled movements throughout.",
            video: "https://www.youtube.com/results?search_query=Chin-Up"
        ),
        Exercise(
            muscles: .Back,
            workOut: "Hyperextension",
            intensityLevel: .expert,
            beginnerSets: .the3SetsWith12To15Reps,
            intermediateSets: .the4SetsWith8To12Reps,
            expertSets: .the5SetsWith3To10Reps,
            equipment: "Hyperextension bench",
            explaination: "Hyperextension: On a hyperextension bench, lift and lower your upper body, targeting your lower back.",
            longExplanation: "The Hyperextension is a weight training exercise targeting the Back. It involves using Hyperextension bench, focusing on the form and technique to effectively engage the muscles. Ideal for strength building and muscle definition, it's important to maintain controlled movements throughout.",
            video: "https://www.youtube.com/results?search_query=Hyperextension"
        )
    ]
}

extension MyExerciseModel {
    static let previewMyExerciseModel: [MyExerciseModel] = [
        MyExerciseModel(
            title: "Preview Warm Up routine",
            routine: [Exercise(
                muscles: .WarmUp,
                workOut: "Jumping Jacks",
                intensityLevel: .expert,
                beginnerSets: .the3SetsWith12To15Reps,
                intermediateSets: .the4SetsWith8To12Reps,
                expertSets: .the5SetsWith3To10Reps,
                equipment: nil,
                explaination: "Jumping Jacks: A full-body movement that increases your heart rate and warms up your muscles.",
                longExplanation: "The Jumping Jacks is a weight training exercise targeting the Warm Up. It involves using nan, focusing on the form and technique to effectively engage the muscles. Ideal for strength building and muscle definition, it's important to maintain controlled movements throughout.",
                video: "https://www.youtube.com/results?search_query=Jumping+Jacks"
            )]
        ),
        MyExerciseModel(
            title: "PRVW Warm Up routine",
            routine: [Exercise(
                muscles: .WarmUp,
                workOut: "Jumping Jacks",
                intensityLevel: .expert,
                beginnerSets: .the3SetsWith12To15Reps,
                intermediateSets: .the4SetsWith8To12Reps,
                expertSets: .the5SetsWith3To10Reps,
                equipment: nil,
                explaination: "Jumping Jacks: A full-body movement that increases your heart rate and warms up your muscles.",
                longExplanation: "The Jumping Jacks is a weight training exercise targeting the Warm Up. It involves using nan, focusing on the form and technique to effectively engage the muscles. Ideal for strength building and muscle definition, it's important to maintain controlled movements throughout.",
                video: "https://www.youtube.com/results?search_query=Jumping+Jacks"
            )]
        ),
        MyExerciseModel(
            title: "Preview 3 Warm Up routine",
            routine: [Exercise(
                muscles: .WarmUp,
                workOut: "Jumping Jacks",
                intensityLevel: .expert,
                beginnerSets: .the3SetsWith12To15Reps,
                intermediateSets: .the4SetsWith8To12Reps,
                expertSets: .the5SetsWith3To10Reps,
                equipment: nil,
                explaination: "Jumping Jacks: A full-body movement that increases your heart rate and warms up your muscles.",
                longExplanation: "The Jumping Jacks is a weight training exercise targeting the Warm Up. It involves using nan, focusing on the form and technique to effectively engage the muscles. Ideal for strength building and muscle definition, it's important to maintain controlled movements throughout.",
                video: "https://www.youtube.com/results?search_query=Jumping+Jacks"
            )]
        )
    ]
}
