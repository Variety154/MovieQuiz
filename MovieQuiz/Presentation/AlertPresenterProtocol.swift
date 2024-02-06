//
//  AlertPresenterProtocol.swift
//  MovieQuiz
//
//  Created by Varvara Kiseleva on 06.02.2024.
//

import Foundation

protocol AlertPresenterProtocol: AnyObject {
    var delegate: AlertPresenterDelegate? { get set }
    func show(alertModel: AlertModel)
}
