//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Varvara Kiseleva on 05.02.2024.
//

import Foundation

struct AlertModel {
    let title: String
    let message: String
    let buttonText: String
    var buttonAction: (() -> Void)?
}
