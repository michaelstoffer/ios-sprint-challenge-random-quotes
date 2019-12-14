//
//  HostingController.swift
//  Quote-WatchOS Extension
//
//  Created by Michael Stoffer on 12/14/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI

class HostingController: WKHostingController<QuoteDetailView> {
    override var body: QuoteDetailView {
        return QuoteDetailView()
    }
}
