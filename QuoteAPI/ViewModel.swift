//
//  ViewModel.swift
//  QuoteAPI
//
//  Created by Amandine Cousin on 23/11/2023.
//

import Foundation

class ViewModel {
    func getQuote() {
        QuoteService.shared.getQuote { error, quote in
            // sera executé en asynchrone
            // je peux reutiliser mes variables success et quote
            print(quote)
        }
    }
}
