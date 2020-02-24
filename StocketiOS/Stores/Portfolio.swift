//
//  PortfolioStore.swift
//  StocketiOS
//
//  Created by Henry Paulino on 2/23/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class Portfolio: ObservableObject {
    @Published var positions = "string"
    
    func getPortfolio() {
        self.positions = "hello"
    }
}
