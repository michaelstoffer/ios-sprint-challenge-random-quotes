//
//  TodayViewController.swift
//  Quote Widget
//
//  Created by Michael Stoffer on 12/14/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import UIKit
import NotificationCenter
import Quotes_Framework

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet weak var quoteLabel: UILabel!
    
    private let fetcher = QuoteFetcher()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        fetcher.fetchQuote { (quote, error) in
            if let error = error {
                NSLog("Error fetching quote: \(error)")
                return
            }
            if let quote = quote {
                self.quoteLabel.text = quote
            }
        }
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
