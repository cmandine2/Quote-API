//
//  Model.swift
//  QuoteAPI
//
//  Created by Amandine Cousin on 23/11/2023.
//

import Foundation

struct Quote: Codable {
    let text: String
    let author: String
    
    enum CodingKeys: String, CodingKey {
        case text = "quoteText"
        case author = "quoteAuthor"
    }
}

enum CustomError: Error {
    case unknownError
    case invalidData
    case authenticationError
    case serverUnavailable
    
    var errorMessage: String {
        switch self {
        case .unknownError:
            return "Unexpected response from the server"
        case .invalidData:
            return "Invalid data received"
        case .authenticationError:
            return "Authentication failed"
        case .serverUnavailable:
            return "The server is currently unavailable"
        }
    }
    
}

class QuoteService {
    static let shared = QuoteService()
    
    private init() {}
    
    func getQuote(callback: @escaping (CustomError?, Quote?) -> Void) {
        guard let quoteUrl = URL(string: "https://api.forismatic.com/api/1.0/?method=getQuote&format=json&lang=en") else {
            
            callback(CustomError.serverUnavailable, nil)
            return
        }
        var request = URLRequest(url: quoteUrl)
        request.httpMethod = "GET"
        
        let urlSession = URLSession(configuration: .default)
        urlSession.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                callback(CustomError.serverUnavailable, nil)
                return
            }
            
            guard let quote = try? JSONDecoder().decode(Quote.self, from: data) else {
                callback(CustomError.invalidData, nil)
                return
            }
            
            callback(nil, quote)
            
        }.resume()
    }
}
