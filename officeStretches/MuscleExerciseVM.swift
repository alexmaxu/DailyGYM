//
//  MuscleExerviseVM.swift
//  officeStretches
//
//  Created by Alex  on 25/5/24.
//

import Foundation
final class MuscleExerciseVM: ObservableObject {
    
    let exerciseInteractor: ExerciseInteractorProtocol
    
    @Published var muscleExercises: [Exercise] = []
    @Published var searchText: String = ""
    
    var muscleTag: Muscles
    
    
    init(exerciseInteractor: ExerciseInteractorProtocol = ExerciseInteractor.shared, muscleTag: Muscles) {
        self.exerciseInteractor = exerciseInteractor
        self.muscleTag = muscleTag
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
