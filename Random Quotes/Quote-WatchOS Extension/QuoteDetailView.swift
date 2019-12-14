//
//  QuoteDetailView.swift
//  Quote-WatchOS Extension
//
//  Created by Michael Stoffer on 12/14/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import SwiftUI
import Quotes_Framework

struct QuoteDetailView: View {
    let fetcher = QuoteFetcher()
    
    @State var currentQuote: String?
    
    var quoteLabelText: String {
        guard let currentQuote = currentQuote else { return "Loading..." }
        
        let quoteString = currentQuote
        
        return "\(quoteString)"
    }
    
    var body: some View {
        VStack {
            Text(quoteLabelText)
        }.onAppear {
            self.loadQuote()
        }
    }
    
    func loadQuote() {
        fetcher.fetchQuote { (quote, error) in
            if let error = error {
                NSLog("There was an error fetching quote: \(error)")
                return
            }
            
            self.currentQuote = quote
        }
    }
}

struct QuoteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteDetailView()
    }
}
