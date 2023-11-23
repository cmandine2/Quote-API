//
//  ContentView.swift
//  QuoteAPI
//
//  Created by Amandine Cousin on 23/11/2023.
//

import SwiftUI

struct ContentView: View {
    let viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Text("")
        }.onAppear {
            viewModel.getQuote()
        }
    }
}

#Preview {
    ContentView()
}
