//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Varvara Kiseleva on 06.02.2024.
//

import Foundation

protocol StatisticService {
    func store(correct count: Int, total amount: Int)
    var totalAccuracy: Double { get }
    var gameCount: Int { get }
    var bestgame: GameRecord { get }
}