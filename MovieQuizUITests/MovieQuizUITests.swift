//
//  MovieQuizUITests.swift
//  MovieQuizUITests
//
//  Created by Varvara Kiseleva on 18.02.2024.
//

import XCTest

final class MovieQuizUITests: XCTestCase {
    
    var app: XCUIApplication!
    
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
    
    func testYesButton() {
        let existsPredicate = NSPredicate(format: "exists == true ")
        
        let firstPoster = app.images["Poster"]
        let expectationFirst = XCTNSPredicateExpectation(predicate: existsPredicate,
                                                         object: firstPoster)
         wait(for: [expectationFirst], timeout: 5)
        let firstPosterData = firstPoster.screenshot().pngRepresentation
        
        app.buttons["Yes"].tap()
        
        let secondPoster = app.images["Poster"]
        let expectationSecond = XCTNSPredicateExpectation(predicate: existsPredicate,
                                                        object: secondPoster)
        wait(for: [expectationSecond], timeout: 5)
        let secondPosterData = secondPoster.screenshot().pngRepresentation
        
        XCTAssertNotEqual(firstPosterData, secondPosterData)
        
        let index = app.staticTexts["Index"]
        
        XCTAssertEqual(index.label, "2/10")
    }
    
    func testNoButton() {
        let existsPredicate = NSPredicate(format: "exists == true")
        
        let firstPoster = app.images["Poster"]
        let expectationFirst = XCTNSPredicateExpectation(
            predicate: existsPredicate,
            object: firstPoster)
        wait(for: [expectationFirst], timeout: 3)
        let firstPosterData = firstPoster.screenshot().pngRepresentation
        
        app.buttons["No"].tap()
        
        let secondPoster = app.images["Poster"]
        let expectationSecond = XCTNSPredicateExpectation(
            predicate: existsPredicate,
            object: secondPoster)
        wait(for: [expectationSecond], timeout: 3)
        let secondPosterData = secondPoster.screenshot().pngRepresentation
        
        let index = app.staticTexts["Index"]
        
        XCTAssertNotEqual(firstPosterData, secondPosterData)
        XCTAssertEqual(index.label, "2/10")
    }
    
    func testEndingAlert() {
        for _ in 1...10{
            app.buttons["Yes"].tap()
        }
        let alert = app.alerts["Alert"]
        
        let existsPredicate = NSPredicate(format: "exists == true")
        let expectationFirst = XCTNSPredicateExpectation(
            predicate: existsPredicate,
            object: alert)
        wait(for: [expectationFirst], timeout: 2)
        
        let alertButton = alert.buttons.firstMatch.label
        XCTAssertEqual(alert.label, "Этот раунд окончен!")
        XCTAssertEqual(alertButton, "Сыграть еще раз")
        
        
    }
    
    func testAlertButton() {
        for _ in 1...10 {
            app.buttons["Yes"].tap()
        }
        
        let alert = app.alerts["Alert"]
        alert.buttons.firstMatch.tap()
        sleep(2)
        let indexLabel = app.staticTexts["Index"]
        
        XCTAssertFalse(alert.exists)
        XCTAssertTrue(indexLabel.label == "1/10")
    }
}
