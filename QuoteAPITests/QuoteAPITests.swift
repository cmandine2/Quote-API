//
//  QuoteAPITests.swift
//  QuoteAPITests
//
//  Created by Amandine Cousin on 23/11/2023.
//

import XCTest
@testable import QuoteAPI

final class QuoteAPITests: XCTestCase {
    func testGetQuoteFailedWithError() {
        // Given
        let quoteService = QuoteService(session: URLSessionFake(data: nil, response: FakeResponseData.responseKO, error: FakeResponseData.error))
        // When
        let expectation = XCTestExpectation(description: "Wait to be on the main queue")
        quoteService.getQuote { error, quote in
            // Then
            XCTAssertNotNil(error)
            XCTAssertNil(quote)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
    func testGetQuoteSuccess() {
        let quoteService = QuoteService(session: URLSessionFake(data: FakeResponseData.correctData, response: FakeResponseData.responseOK, error: nil))
        // When
        let expectation = XCTestExpectation(description: "Wait to be on the main queue")
        quoteService.getQuote { error, quote in
            // Then
            XCTAssertNil(error)
            XCTAssertNotNil(quote)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1)
    }
    
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}
