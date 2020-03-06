//
//  Trade.swift
//  StocketiOS
//
//  Created by Henry Paulino on 3/5/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI
import Foundation

class Trade: ObservableObject {
    @Published var showModal: Bool = false
    
    func toggleModal(_ state: Bool) {
        self.showModal = state
    }
}
