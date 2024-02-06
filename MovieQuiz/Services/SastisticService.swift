//
//  StstisticService.swift
//  MovieQuiz
//
//  Created by Varvara Kiseleva on 06.02.2024.
//

import Foundation

final class StatisticServiceImplementaton: StatisticService {
    private let userDefaults = UserDefaults.standard
    
    private enum Keys: String {
        case correct, total, bestGame, gameCount
    }
    
    var totalAccuracy: Double {
        get {
            
        }
        set {
            
        }
    }
    
    var gameCount: Int {
        get {
            
        }
        set {
            
        }
    }
    
    var bestgame: GameRecord {
        get {
            guard let deta = userDefaults.data(forKey: Keys.bestGame.rawValue),
                  let record = try? JSONDecoder().decode(GameRecord.self, from: data) else {
                return .init(correct: 0, total: 0, date: Date())
            }
            return record
        }
        set {
            guard let data = try? JSONEncoder().encode(newValue) else {
                print("Невозможно сохранить результат")
                return
            }
            userDefaults.set(data, forKey: Keys.bestGame.rawValue)
        }
    }
    func store(correct count: Int, total amount: Int) {
        
    }
}
