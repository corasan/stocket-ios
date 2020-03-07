//
//  Trade.swift
//  StocketiOS
//
//  Created by Henry Paulino on 3/5/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

class Trade: ObservableObject {
    @Published var showModal: Bool = false
    @Published var shares: [String] = [] {
        didSet {
            calcTotal()
        }
    }
    @Published var action: String = "BUY"
    @Published var total: String = "0"
    @Published var stock = [String: String]()
    
    func toggleModal(_ state: Bool) {
        self.showModal = state
    }
    
    func getSharesNumber() -> String {
        return self.shares.count == 0 ? "0" : self.shares.joined(separator: "")
    }
    
    func calcTotal() {
        let total = Double(getSharesNumber())! * Double(self.stock["price"]!)!
        self.total = String(format: "%.2f", total)
    }
    
    func createTrade(price: String, symbol: String) {
        let user = Auth.auth().currentUser
        let db = Firestore.firestore().collection("Users")
        
        if let user = user {
            db.document(user.uid).collection("trades").addDocument(data: [
                "symbol": self.stock["symbol"]!,
                "price": self.stock["price"]!,
                "quantity": self.shares.joined(separator: ""),
                "action": self.action,
                "value": $total
            ])
        }
    }
}
