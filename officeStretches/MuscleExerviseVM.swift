//
//  MuscleExerviseVM.swift
//  officeStretches
//
//  Created by Alex  on 25/5/24.
//

import Foundation
final class MuscleExerviseVM: ObservableObject {
    
    let exerciseInteractor: ExerciseInteractorProtocol
    
    @Published var muscleExercises: [Exercise] = []
    @Published var searchText: String = ""
    
    var muscleTag: Muscles = .All
    
    
    init(exerciseInteractor: ExerciseInteractorProtocol = ExerciseInteractor.shared) {
        self.exerciseInteractor = exerciseInteractor
        Task {
            await getMuscleExerciseList()
        }
    }
    
    func getMuscleExerciseList() async {
        do {
            let exerciseListResult = try await exerciseInteractor.fetchExercises(muscle: muscleTag)
            await MainActor.run {
                self.muscleExercises = exerciseListResult
            }
        } catch {
            print(error)
        }
    }
    
}
