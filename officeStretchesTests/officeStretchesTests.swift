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
}
