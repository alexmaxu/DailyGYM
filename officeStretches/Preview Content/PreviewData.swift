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
