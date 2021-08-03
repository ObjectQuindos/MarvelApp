//
//  MarvelAppTests.swift
//  MarvelAppTests
//
//  Created by David López Quindos on 2/8/21.
//

import XCTest
@testable import MarvelApp

class MarvelAppTests: XCTestCase {
    
    func testFetchCharacters() {
        let exp = XCTestExpectation(description: "Download characters")
        let expectedCode = 200
        var resultResponse: APIReturnDataSet?
        
        ServiceRequests().fetchCharacters { (result) in
            resultResponse = result
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 3.0)
        XCTAssertEqual(expectedCode, resultResponse?.code, "Request Failed")
    }
    
    func testFetchCharacterInfo() {
        let exp = XCTestExpectation(description: "Download character info")
        let expectedCode = 200
        var resultResponse: APIReturnDataSet?
        
        ServiceRequests().fetchCharacterInfo(characterId: 1011334) { (result) in
            resultResponse = result
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 3.0)
        XCTAssertEqual(expectedCode, resultResponse?.code, "Request Failed")
    }
    
    func testDateFormat() {
        let testDate = "2014-04-29T14:18:17-0400"
        let expectedDate = "29 abr 2014"
        let locale = Locale(identifier: "es_ES")
        
        let resultDate = testDate.setFormatStyle(locale: locale)
        XCTAssertEqual(expectedDate, resultDate, "expectedDate: \(expectedDate) not equal to resultDate: \(resultDate)")
    }
}
