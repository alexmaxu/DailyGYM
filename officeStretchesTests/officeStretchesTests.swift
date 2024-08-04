//
//  officeStretchesTests.swift
//  officeStretchesTests
//
//  Created by Alex  on 30/7/24.
//

import XCTest
@testable import officeStretches

final class officeStretchesTests: XCTestCase {

    func testExerciseInit() {
        // Given
        let muscle: Muscles = .Abs
        let workOut = "Work out Name"
        let intensityLevel: IntensityLevel = .beginner
        let beginnerSets: BeginnerSets = .the3SetsWith12To15Reps
        let intermediateSets: IntermediateSets = .the4SetsWith8To12Reps
        let expertSets: ExpertSets = .the5SetsWith3To10Reps
        let equipment = ""
        let explanation = "Explanation text"
        let longExplanation = "Long explanation"
        let video = ""
        
        // When
        let exercise = Exercise(
            muscles: muscle,
            workOut: workOut,
            intensityLevel: intensityLevel,
            beginnerSets: beginnerSets,
            intermediateSets: intermediateSets,
            expertSets: expertSets,
            equipment: equipment,
            explaination: explanation,
            longExplanation: longExplanation,
            video: video
        )
        
        // Then
        XCTAssertEqual(exercise.muscles, muscle)
        XCTAssertEqual(exercise.workOut, workOut)
        XCTAssertEqual(exercise.intensityLevel, intensityLevel)
        XCTAssertEqual(exercise.beginnerSets, beginnerSets)
        XCTAssertEqual(exercise.intermediateSets, intermediateSets)
        XCTAssertEqual(exercise.expertSets, expertSets)
        XCTAssertEqual(exercise.equipment, equipment)
        XCTAssertEqual(exercise.explaination, explanation)
        XCTAssertEqual(exercise.longExplanation, longExplanation)
        XCTAssertEqual(exercise.video, video)
    }
    
    func testProfileInit() {
        // Given
        let name = "Random Name"
        let levelSets = CaseSets.beginner
        let lvl = 12
        let image = ProfileImage.mapache
        
        // When
        let profile = Profile(name: name, levelSets: levelSets, lvl: lvl, image: image)
        
        // Then
        XCTAssertEqual(name, profile.name)
        XCTAssertEqual(levelSets, profile.levelSets)
        XCTAssertEqual(lvl, profile.lvl)
        XCTAssertEqual(image, profile.image)

    }
    
    func testMyExerciseModel() {
        // Given
        let title = "Title 1"
        let description = "Random Text Description"
        let routine = Exercise.previewExercisesList
        
        // When
        let myExerciseModel = MyExerciseModel(title: title, description: description, routine: routine)
        
        // Then
        XCTAssertEqual(title, myExerciseModel.title)
        XCTAssertEqual(description, myExerciseModel.description)
        XCTAssertEqual(routine, myExerciseModel.routine)
        
    }
    
    func testHistoryModel() {
        // Given
        let id = UUID()
        let title = "Title 1"
        let date = "27/02/2024"
        let exercises = Exercise.previewExercisesList
        
        // When
        let historyModel = HistoryModel(id: id, title: title, date: date, exercises: exercises)
        
        // Then
        XCTAssertEqual(id, historyModel.id)
        XCTAssertEqual(title, historyModel.title)
        XCTAssertEqual(date, historyModel.date)
        XCTAssertEqual(exercises, historyModel.exercises)
    }
}
