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

struct Position: Identifiable {
    var id: String
    var gains: String
    var gainsPercentage: String
    var symbol: String
    var value: String
}

class Portfolio: ObservableObject {
    static private var portfolioListener: ListenerRegistration?
    
    static func subscribe(limit: Int = 20, _ onSuccess: @escaping (_ positions: [Position]) -> Void) {
        let user = Auth.auth().currentUser
        let db = Firestore.firestore().collection("Users")
        
        if let user = user {
            let ref = db.document(user.uid).collection("positions")
            self.portfolioListener = ref.addSnapshotListener { snapshot, err in
                guard let documents = snapshot?.documents else {
                    print("Error fetching positions")
                    return
                }
                
                DispatchQueue.main.async {
                    let docs = documents.map { pos in
                        return Position(
                            id: pos.documentID,
                            gains: String(format:"%.2f", pos.get("gains") as! Double),
                            gainsPercentage: String(format:"%.2f", pos.get("gainsPercentage") as! Double),
                            symbol: pos.get("symbol") as! String,
                            value: String(format:"%.2f", pos.get("value") as! Double)
                        )
                    }
                    print(docs)
                    onSuccess(docs)
                }
            }
        }
    }
    
    static func unsubscribe() {
        print("unsubscribed")
        self.portfolioListener?.remove()
    }
    
    deinit {
        print("Portfolio deallocated")
    }
}
