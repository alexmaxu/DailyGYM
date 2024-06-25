//
//  MainViewVM.swift
//  officeStretches
//
//  Created by Alex  on 22/5/24.
//

import Foundation

final class MainViewVM: ObservableObject {
    
    let exerciseInteractor: ExerciseInteractorProtocol
    
    @Published var dailyRoutine: [Exercise] = []
    @Published var myExercises: [MyExerciseModel] = [] {
        didSet {
            saveMyExercises()
        }
    }
    
    @Published var exercises: [Exercise] = []

    @Published var history: [HistoryModel] = HistoryModel.previewHistoryList
    
    var muscleTofind: Muscles = .All
    
    init(exerciseInteractor: ExerciseInteractorProtocol = ExerciseInteractor.shared ) {
        self.exerciseInteractor = exerciseInteractor
        getMyExercises()
        Task {
            await getAllExercises()
            await getRandomRoutine()
        }
    }
    
    func saveMyExercises() {
        do {
            try exerciseInteractor.saveMyExercises(myExercises: myExercises)
        } catch {
            print(error)
        }
    }
    
    func getMyExercises() {
        do {
            self.myExercises = try exerciseInteractor.loadMyExercises()
        } catch {
            self.myExercises = []
        }
    }
    
    
    func addToHistory(title: String, exercises: [Exercise]) {
        let today = Date.now
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        let dateFormatted = formatter.string(from: today)
        let historyToAdd = HistoryModel(title: title, date: dateFormatted, exercises: exercises)
        history.append(historyToAdd)
    }
    
    func addToMyExercises(titleRoutine: String, routine: [Exercise]) {
        myExercises.append(MyExerciseModel(title: titleRoutine, routine: routine))
    }
    
    func getAllExercises() async {
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
