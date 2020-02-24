//
//  User.swift
//  StocketiOS
//
//  Created by Henry Paulino on 2/23/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

class User: ObservableObject {
    @Published var data = [String: Any]()
    
    func getUserData() {
        let user = Auth.auth().currentUser
        let db = Firestore.firestore().collection("Users")
        
        if let user = user {
            db.document(user.uid).addSnapshotListener { snapshot, err in
                guard let document = snapshot else {
                    print("Error getting user data")
                    return
                }
                
                let result = document.data()!
                
                DispatchQueue.main.async {
                    self.data = result
                }
            }
        }
    }
}
