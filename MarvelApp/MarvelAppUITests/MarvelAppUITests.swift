//
//  MarvelAppUITests.swift
//  MarvelAppUITests
//
//  Created by David López Quindos on 2/8/21.
//

import XCTest

class MarvelAppUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNameCharacterLabel() throws {
        let app = XCUIApplication()
        app.launch()
        
        let nameIdentifierExpected = "nameCharacterLabel"
        let nameLabelIdentifier = app.tables.children(matching: .cell).element(boundBy: 0).staticTexts["nameCharacterLabel"].label
        XCTAssertEqual(nameIdentifierExpected, nameLabelIdentifier, "UILabel not exists: \(nameLabelIdentifier)")
    }
    
    func testDateModifiedLabel() throws {
        let app = XCUIApplication()
        app.launch()
        
        let dateIdentifierExpected = "dateModifiedLabel"
        let dateLabelIdentifier = app.tables.children(matching: .cell).element(boundBy: 0).staticTexts["dateModifiedLabel"].label
        XCTAssertEqual(dateIdentifierExpected, dateLabelIdentifier, "UILabel not exists: \(dateLabelIdentifier)")
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
