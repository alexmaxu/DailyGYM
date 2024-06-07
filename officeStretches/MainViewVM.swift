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
    @Published var dailyRoutine: [Exercise] = []
    @Published var myExercises: [MyExerciseModel] = MyExerciseModel.previewMyExerciseList
    
    @Published var myExervisListToSave: [Exercise] = Exercise.previewExercisesList
    
    var muscleTofind: Muscles = .All
    
    init(exerciseInteractor: ExerciseInteractorProtocol = ExerciseInteractor.shared ) {
        self.exerciseInteractor = exerciseInteractor
        Task {
            await getExercises()
            await getRandomRoutine()
        }
    }
    
    func getExercises() async {
        do {
            let exercisesResults = try await exerciseInteractor.fetchExercises(muscle: muscleTofind)
            await MainActor.run {
                self.exercises = exercisesResults
            }
        } catch {
            print(error)
        }
    }
    
    func getRandomRoutine() async {
        if !exercises.isEmpty {
            let maxNumberExercises = exercises.count
            await MainActor.run {
                for _ in 0...3 {
                    dailyRoutine.append(exercises[Int.random(in: 0..<maxNumberExercises)])
                }
            }
        }
    }
}
