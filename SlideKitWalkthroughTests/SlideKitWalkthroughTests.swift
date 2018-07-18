//
//  SlideKitWalkthroughTests.swift
//  SlideKitWalkthroughTests
//
//  Created by Kyler Jensen on 7/18/18.
//  Copyright © 2018 Kyler Jensen. All rights reserved.
//

import XCTest

class SlideKitWalkthroughTests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        XCUIDevice().orientation = .portrait
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testWalkthrough() {
        
        let app = XCUIApplication()
        let nextButton = app.buttons["Next"]
        let backButton = app.buttons["Back"]
        
        nextButton.tap()
        nextButton.tap()
        nextButton.tap()
        backButton.tap()
        backButton.tap()
        backButton.tap()
        
        app.sliders.element(boundBy: 0).adjust(toApproximateSliderPosition: 0.45)
        app.sliders.element(boundBy: 1).adjust(toApproximateSliderPosition: 0.35)
        app.sliders.element(boundBy: 2).adjust(toApproximateSliderPosition: 0.65)
        app.sliders.element(boundBy: 3).adjust(toApproximateSliderPosition: 0.50)
        
        app.sliders.element(boundBy: 4).adjust(toApproximateSliderPosition: 0.75)
        app.sliders.element(boundBy: 5).adjust(toApproximateSliderPosition: 0.15)
        app.sliders.element(boundBy: 6).adjust(toApproximateSliderPosition: 0.50)
        app.sliders.element(boundBy: 7).adjust(toApproximateSliderPosition: 0.85)
        
        nextButton.tap()
        nextButton.tap()
        nextButton.tap()
        backButton.tap()
        backButton.tap()
        backButton.tap()
        
    }
    
}

private extension XCUIElement {
    
    var sliderHandleCoordinate: XCUICoordinate {
        var sliderPosition = CGFloat((value as! NSString).floatValue) / 100
        if sliderPosition == 0.00 {
            sliderPosition = 0.10
        }
        if sliderPosition == 1.00 {
            sliderPosition = 0.90
        }
        return coordinate(withNormalizedOffset: CGVector(dx: sliderPosition, dy: 0.5))
    }
    
    func adjust(toApproximateSliderPosition newPosition: CGFloat) {
        let oldCoordinate = sliderHandleCoordinate
        let newCoordinate = coordinate(withNormalizedOffset: CGVector(dx: newPosition, dy: 0.5))
        oldCoordinate.press(forDuration: 0, thenDragTo: newCoordinate)
    }
    
}
