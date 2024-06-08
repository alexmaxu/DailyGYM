//
//  ExerciseInteractor.swift
//  officeStretches
//
//  Created by Alex  on 22/5/24.
//

import Foundation

protocol ExerciseInteractorProtocol {
    func fetchExercises(muscle: Muscles) async throws -> [Exercise]
    func fetchAllExercises() async throws -> [Exercise]
}

struct ExerciseInteractor: NetworkInteractor, ExerciseInteractorProtocol {
    var session: URLSession
    
    static let shared = ExerciseInteractor()
    
    private init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchExercises(muscle: Muscles) async throws -> [Exercise] {
        try await getJSONFromURL(request: .get(url: .getExerciseURL, muscle: muscle), type: [Exercise].self)
    }
    
    func fetchAllExercises() async throws -> [Exercise] {
        try await getJSONFromURL(request: .getAllExercisesURL(url: .getExerciseURL), type: [Exercise].self)
    }
}


