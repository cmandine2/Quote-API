//
//  FakeResponseData.swift
//  QuoteAPITests
//
//  Created by Amandine Cousin on 23/11/2023.
//

import Foundation

class FakeResponseData {
    static let responseOK = HTTPURLResponse(url: URL(string: "https://api.forismatic.com/api/1.0/")!, statusCode: 200, httpVersion: nil, headerFields: nil)
    static let responseKO = HTTPURLResponse(url: URL(string: "https://api.forismatic.com/api/1.0/")!, statusCode: 500, httpVersion: nil, headerFields: nil)
    
    class QuoteError: Error {}
    static let error = QuoteError()
    
    static let incorrectData = "error".data(using: .utf8)
    static var correctData: Data {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "QuoteMock", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        return data
    }
}
