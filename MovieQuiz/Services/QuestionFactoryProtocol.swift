//
//  QuestionFactoryProtocol.swift
//  MovieQuiz
//
//  Created by Varvara Kiseleva on 05.02.2024.
//

import Foundation

protocol QuestionFactoryProtocol {
    var delegate: QuestionFactoryDelegate? { get set }
    func requestNextQuestion()
    func loadData()
}
