//
//  MainViewVM.swift
//  officeStretches
//
//  Created by Alex  on 22/5/24.
//

import Foundation

final class MainViewVM: ObservableObject {
    
    let exerciseInteractor: ExerciseInteractorProtocol
    
    @Published var exercises: [Exercise] = []
    
    init(exerciseInteractor: ExerciseInteractorProtocol = ExerciseInteractor.shared ) {
        self.exerciseInteractor = exerciseInteractor
        Task {
            await getExercises()
        }
    }
    
    func getExercises() async {
        do {
            let exercisesResults = try await exerciseInteractor.fetchExercises(muscle: .Biceps)
            await MainActor.run {
                self.exercises = exercisesResults
            }
        } catch {
            print(error)
        }
    }
    
}
