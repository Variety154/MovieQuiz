//
//  MovieQuizUITests.swift
//  MovieQuizUITests
//
//  Created by Varvara Kiseleva on 18.02.2024.
//

import XCTest

var app: XCUIApplication!

final class MovieQuizUITests: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        app = XCUIApplication()
        app.launch()
        
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        app.terminate()
        app = nil
    }
    
    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
    }
    
    func testYesButton() {
        sleep(2)
        
        let firstPoster = app.images["Poster"]
        let firstPosterData = firstPoster.screenshot().pngRepresentation
        let firstQuestion = app.staticTexts["question"]
        
        app.buttons["Yes"].tap()
        sleep(2)
        
        let secondPoster = app.images["Poster"]
        let secondPosterData = secondPoster.screenshot().pngRepresentation
        let secondQuestion = app.staticTexts["question"]
        
        XCTAssertNotEqual(firstPosterData, secondPosterData)
        
        let indexLabel = app.staticTexts["index"]
        XCTAssertEqual(indexLabel.label, "2/10")
        XCTAssertNotEqual(firstQuestion, secondQuestion)
    }
    
    func testNoButton() {
        sleep(2)
        
        let firstPoster = app.images["Poster"]
        let firstPosterData = firstPoster.screenshot().pngRepresentation
        let firstQuestion = app.staticTexts["question"]
        
        app.buttons["No"].tap()
        sleep(2)
        
        let secondPoster = app.images["Poster"]
        let secondPosterData = secondPoster.screenshot().pngRepresentation
        let secondQuestion = app.staticTexts["question"]
        
        XCTAssertNotEqual(firstPosterData, secondPosterData)
        
        let indexLabel = app.staticTexts["index"]
        XCTAssertEqual(indexLabel.label, "2/10")
        XCTAssertNotEqual(firstQuestion, secondQuestion)
    }
    
    func testGameFinish() {
        sleep(3)
        for _ in 1...10 {
            app.buttons["No"].tap()
            sleep(3)
        }
        
        let alert = app.alerts["Этот раунд окончен!"]
        
        XCTAssertTrue(alert.exists)
        XCTAssertTrue(alert.label == "Этот раунд окончен!")
        XCTAssertTrue(alert.buttons.firstMatch.label == "Сыграть ещё раз")
    }
    
    func testAlertDismiss() {
            sleep(2)
            for _ in 1...10 {
                app.buttons["No"].tap()
                sleep(2)
            }
            
            let alert = app.alerts["Этот раунд окончен!"]
            alert.buttons.firstMatch.tap()
            
            sleep(2)
            
            let indexLabel = app.staticTexts["index"]
            
            XCTAssertFalse(alert.exists)
            XCTAssertTrue(indexLabel.label == "1/10")
        }
}
