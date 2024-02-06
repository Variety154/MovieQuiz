//
//  AlertPresenterDelegate.swift
//  MovieQuiz
//
//  Created by Varvara Kiseleva on 06.02.2024.
//

import Foundation

import UIKit

protocol AlertPresenterDelegate: AnyObject {
    func show(alert: UIAlertController)
}
