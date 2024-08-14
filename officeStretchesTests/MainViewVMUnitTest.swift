//
//  qwerqwerqwer.swift
//  officeStretchesTests
//
//  Created by Alex  on 2/8/24.
//

import XCTest
@testable import officeStretches

final class MainViewVMUnitTest: XCTestCase {
    
    var mainViewVM: MainViewVM!

    override func setUpWithError() throws {
        mainViewVM = MainViewVM()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddToHistory() throws {
        // Given
        let title = "History 1"
        let exercises = Exercise.previewExercisesList
        mainViewVM.history.removeAll()
        
        // When
        mainViewVM.addToHistory(title: title, exercises: exercises)
        
        // Then
        XCTAssertEqual(mainViewVM.history.count, 1)
    }

    func testAddToMyExercises() throws {
        // Given
        let titleRoutine = "Title 1"
        let routine = Exercise.previewExercisesList
        let myExerciseCountBefore = mainViewVM.myExercises.count
        
        // When
        mainViewVM.addToMyExercises(titleRoutine: titleRoutine, routine: routine)
        
        // Then
        XCTAssertEqual(mainViewVM.myExercises.count, myExerciseCountBefore + 1)
    }

}
