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
        let title = "History 1"
        let exercises = Exercise.previewExercisesList
        let historyCountBefore = mainViewVM.history.count
    
        mainViewVM.addToHistory(title: title, exercises: exercises)
        
        XCTAssertEqual(mainViewVM.history.count, historyCountBefore + 1)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
