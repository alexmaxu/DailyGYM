//
//  MuscleExerviseVM.swift
//  officeStretches
//
//  Created by Alex  on 25/5/24.
//

import Foundation
final class MuscleExerciseListVM: ObservableObject {
    
    let exerciseInteractor: ExerciseInteractorProtocol
    
    @Published var allExercises: [Exercise] = []
    @Published var muscleExercises: [Exercise] = []
    @Published var myExervisListToSave: [Exercise] = []
    @Published var searchText: String = ""
    
    var muscleTag: Muscles
    var exerciseDictionary: [Muscles:[Exercise]] = [:]
    
    init(exerciseInteractor: ExerciseInteractorProtocol = ExerciseInteractor.shared, muscleTag: Muscles) {
        self.exerciseInteractor = exerciseInteractor
        self.muscleTag = muscleTag
        Task {
            await getMuscleExerciseList()
            await getAllExercises()
            for exercise in allExercises {
                if exerciseDictionary[exercise.muscles] == nil {
                    exerciseDictionary[exercise.muscles] = [exercise]
                } else {
                    exerciseDictionary[exercise.muscles]?.append(exercise)
                }
            }
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
    
    func getMuscleExerciseListWithMuscle(muscle: Muscles) async {
        do {
            let exerciseListResult = try await exerciseInteractor.fetchExercises(muscle: muscle)
            
            await MainActor.run {
                exerciseDictionary[muscle] = exerciseListResult
                print(muscle.rawValue)
            }
        } catch {
            print(error)
        }
    }
    
    func getAllExercises() async {
        do {
            let exerciseListResult = try await exerciseInteractor.fetchAllExercises()
            print(exerciseListResult.count)
            await MainActor.run {
                self.allExercises = exerciseListResult
            }
        } catch {
            print(error)
        }
    }
    
}
