//
//  File.swift
//  StocketiOS
//
//  Created by Henry Paulino on 3/4/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import Foundation

class Stock: ObservableObject {
    var data = [[String: String]]()
    @Published var selectedStock = [String: String]()
    
    func selectStock(_ data: [String: String]) {
        self.selectedStock = data
    }
}
