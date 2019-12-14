//
//  ViewController.swift
//  Random Quotes
//
//  Created by Michael Stoffer on 12/14/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import UIKit
import Quotes_Framework

class ViewController: UIViewController {

    @IBOutlet weak var quoteLabel: UILabel!
    
    private let fetcher = QuoteFetcher()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetcher.fetchQuote { (quote, error) in
            if let error = error {
                NSLog("Error fetching quote: \(error)")
                return
            }
            if let quote = quote {
                self.quoteLabel.text = quote
            }
        }
    }


}

