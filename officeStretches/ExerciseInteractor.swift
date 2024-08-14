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
    
    func loadMyExercises() throws -> [MyExerciseModel]
    func saveMyExercises(myExercises: [MyExerciseModel]) throws
    
    func loadHistory() throws -> [HistoryModel]
    func saveHistory(history: [HistoryModel]) throws
    
    func saveDate(date: Date) throws
    func loadDay() throws -> Date
    
    func saveDalyRoutine(dailyRoutine: [Exercise]) throws
    func loadDailyRoutine() throws -> [Exercise]
}

struct ExerciseInteractor: NetworkInteractor, ExerciseInteractorProtocol {
    var session: URLSession
    
    static let shared = ExerciseInteractor()
    
    private init(session: URLSession = .shared) {
        self.session = session
    }
    
    func saveDalyRoutine(dailyRoutine: [Exercise]) throws {
        let data = try JSONEncoder().encode(dailyRoutine)
        try data.write(to: URL.documentsDirectory.appending(path: "DailyRoutine.json"), options: .atomic)
    }
    
    func loadDailyRoutine() throws -> [Exercise] {
        if FileManager.default.fileExists(atPath: URL.documentsDirectory.appending(path: "DailyRoutine.json").path()) {
            let data = try Data(contentsOf: URL.documentsDirectory.appending(path: "DailyRoutine.json"))
            return try JSONDecoder().decode([Exercise].self, from: data)
        } else {
            return []
        }
    }
    
    func saveDate(date: Date) throws {
        let data = try JSONEncoder().encode(date)
        try data.write(to: URL.documentsDirectory.appending(path: "Date.json"), options: .atomic)
    }
    
    func loadDay() throws -> Date {
        if FileManager.default.fileExists(atPath: URL.documentsDirectory.appending(path: "Date.json").path()) {
            let data = try Data(contentsOf: URL.documentsDirectory.appending(path: "Date.json"))
            return try JSONDecoder().decode(Date.self, from: data)
        } else {
            return Date.now
        }
    }
    
    func fetchExercises(muscle: Muscles) async throws -> [Exercise] {
        try await getJSONFromURL(request: .get(url: .getExerciseURL, muscle: muscle), type: [Exercise].self)
    }
    
    func fetchAllExercises() async throws -> [Exercise] {
        try await getJSONFromURL(request: .getAllExercisesURL(url: .getExerciseURL), type: [Exercise].self)
    }
    
    func loadMyExercises() throws -> [MyExerciseModel] {
        if FileManager.default.fileExists(atPath: URL.documentsDirectory.appending(path: "MyExercises.json").path()) {
            let data = try Data(contentsOf: URL.documentsDirectory.appending(path: "MyExercises.json"))
            return try JSONDecoder().decode([MyExerciseModel].self, from: data)
        } else {
            return []
        }
    }

    func saveMyExercises(myExercises: [MyExerciseModel]) throws {
        let data = try JSONEncoder().encode(myExercises)
        try data.write(to: URL.documentsDirectory.appending(path: "MyExercises.json"), options: .atomic)
    }
    
    func loadHistory() throws -> [HistoryModel] {
        if FileManager.default.fileExists(atPath: URL.documentsDirectory.appending(path: "History.json").path()) {
            let data = try Data(contentsOf: URL.documentsDirectory.appending(path: "History.json"))
            return try JSONDecoder().decode([HistoryModel].self, from: data)
        } else {
            return []
        }
    }
    
    func saveHistory(history: [HistoryModel]) throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try encoder.encode(history)
        try data.write(to: URL.documentsDirectory.appending(path: "History.json"), options: .atomic)
        print(URL.documentsDirectory.appending(path: "History.json"))
    }
}


