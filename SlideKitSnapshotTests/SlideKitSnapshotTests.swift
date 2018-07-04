//
//  SlideKitSnapshotTests.swift
//  SlideKitSnapshotTests
//
//  Created by Kyler Jensen on 7/11/18.
//  Copyright © 2018 Kyler Jensen. All rights reserved.
//

import XCTest
import FBSnapshotTestCase

class SlideKitSnapshotTests: FBSnapshotTestCase {
        
    override func setUp() {
        super.setUp()
        recordMode = true
        continueAfterFailure = false
        XCUIApplication().launch()
        XCUIDevice().orientation = .portrait
    }
    
    func testInitialLayoutIsCorrect() {
        let app = XCUIApplication()
        app.buttons["Put 'em up!"].tap()
        FBSnapshotVerifyView(UIImageView(image: app.screenshot().image))
    }
    
    func testLayoutIsCorrectAfterPush() {
        let app = XCUIApplication()
        app.buttons["Put 'em up!"].tap()
        app.buttons["Next"].tap()
        FBSnapshotVerifyView(UIImageView(image: app.screenshot().image))
    }
    
    func testLayoutIsCorrectAfterPushAndPop() {
        let app = XCUIApplication()
        app.buttons["Put 'em up!"].tap()
        app.buttons["Next"].tap()
        app.buttons["Page 1"].tap()
        FBSnapshotVerifyView(UIImageView(image: app.screenshot().image))
    }
    
    func testLayoutIsCorrectAfterTwoPushes() {
        let app = XCUIApplication()
        app.buttons["Put 'em up!"].tap()
        app.buttons["Next"].tap()
        app.buttons["Next"].tap()
        FBSnapshotVerifyView(UIImageView(image: app.screenshot().image))
    }
    
    func testLayoutIsCorrectAfterTwoPushesAndOnePop() {
        let app = XCUIApplication()
        app.buttons["Put 'em up!"].tap()
        app.buttons["Next"].tap()
        app.buttons["Next"].tap()
        app.buttons["Page 2"].tap()
        FBSnapshotVerifyView(UIImageView(image: app.screenshot().image))
    }
    
    func testLayoutIsCorrectAfterTwoPushesAndTwoPops() {
        let app = XCUIApplication()
        app.buttons["Put 'em up!"].tap()
        app.buttons["Next"].tap()
        app.buttons["Next"].tap()
        app.buttons["Page 2"].tap()
        app.buttons["Page 1"].tap()
        FBSnapshotVerifyView(UIImageView(image: app.screenshot().image))
    }
    
}
