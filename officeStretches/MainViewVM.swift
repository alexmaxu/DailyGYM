//
//  MainViewVM.swift
//  officeStretches
//
//  Created by Alex  on 22/5/24.
//

import Foundation

final class MainViewVM: ObservableObject {
    
    let exerciseInteractor: ExerciseInteractorProtocol
    
    var exerciseDictionary: [Muscles:[Exercise]] = [:]
    @Published var myExervisListToSave: [Exercise] = []
    
    @Published var dailyRoutine: [Exercise] = []
    @Published var myExercises: [MyExerciseModel] = [] {
        didSet {
            saveMyExercises()
        }
    }
    
    @Published var exercises: [Exercise] = []

    @Published var history: [HistoryModel] = [] {
        didSet {
            saveHistory()
        }
    }
    
    var muscleTofind: Muscles = .All
    var newToday: Date = Date.now
    @Published var isLoading = true
    
    init(exerciseInteractor: ExerciseInteractorProtocol = ExerciseInteractor.shared ) {
        self.exerciseInteractor = exerciseInteractor
        getMyExercises()
        loadHistory()
        
        Task {
            await getAllExercises()
            if isSameDay() {
                loadDailyRoutine()
                if dailyRoutine.isEmpty {
                    await getRandomRoutine()
                }
                saveDailyRoutine()
            } else {
                await getRandomRoutine()
                saveDailyRoutine()
            }
            await MainActor.run {
                isLoading.toggle()
            }
            
            for exercise in exercises {
                if exerciseDictionary[exercise.muscles] == nil {
                    exerciseDictionary[exercise.muscles] = [exercise]
                } else {
                    exerciseDictionary[exercise.muscles]?.append(exercise)
                }
            }
            saveDate()
        }
    }
    
    func loadDailyRoutine() {
        do {
            self.dailyRoutine = try exerciseInteractor.loadDailyRoutine()
        } catch {
            print(error)
        }
    }
    
    func saveDailyRoutine() {
        do {
            try exerciseInteractor.saveDalyRoutine(dailyRoutine: dailyRoutine)
        } catch {
            print(error)
        }
    }
    
    func isSameDay() -> Bool {
        let lastDay = loadDate()
        let calendar = Calendar.current
        
        let lastDayCalendar = calendar.dateComponents([.day, .month, .year], from: lastDay)
        print(lastDayCalendar)
        
        let newTodayCalendar = calendar.dateComponents([.day, .month, .year], from: newToday)
        print(newTodayCalendar)
        
        if lastDayCalendar == newTodayCalendar {
            print("Is same day")
            return true
        } else {
            print("No")
            return false
        }
    }
    
    func loadDate() -> Date {
        do {
            return try exerciseInteractor.loadDay()
        } catch {
            print(error)
            return Date.now
        }
    }
    
    func saveDate() {
        do {
            try exerciseInteractor.saveDate(date: Date.now)
        } catch {
            print(error)
        }
    }
    
    func addToHistory(title: String, exercises: [Exercise]) {
        let today = Date.now
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        let dateFormatted = formatter.string(from: today)
        let historyToAdd = HistoryModel(title: title, date: dateFormatted, exercises: exercises)
        history.insert(historyToAdd, at: 0)
    }
    
    func loadHistory() {
        do {
            self.history = try exerciseInteractor.loadHistory()
        } catch {
            print(error)
        }
    }
    
    func saveHistory() {
        do {
            try exerciseInteractor.saveHistory(history: history)
        } catch {
            print(error)
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
    
    func addToMyExercises(titleRoutine: String, routine: [Exercise]) {
        myExercises.append(MyExerciseModel(title: titleRoutine, routine: routine))
    }
    
    func getAllExercises() async {
        do {
            let exercisesResults = try await exerciseInteractor.fetchExercises(muscle: muscleTofind)
            print("get all exercises MainVM")
            await MainActor.run {
                self.exercises = exercisesResults
            }
        } catch {
            print(error)
        }
    }
    
    func getRandomRoutine() async {
///      if need to test an image from daily routine
//        await MainActor.run {
//            dailyRoutine.append(Exercise(muscles: .Glutes, workOut: "", intensityLevel: .beginner, beginnerSets: .the3SetsWith12To15Reps, intermediateSets: .the4SetsWith8To12Reps, expertSets: .the5SetsWith3To10Reps, equipment: "", explaination: "", longExplanation: "", video: ""))
//        }
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
