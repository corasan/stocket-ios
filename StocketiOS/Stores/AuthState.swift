//
//  AuthState.swift
//  Production
//
//  Created by Henry Paulino on 2/22/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import Foundation
import FirebaseAuth

class AuthState: ObservableObject {
    @Published var isAuth: Bool = false
    private var listener: AuthStateDidChangeListenerHandle?
    
    func listen() {
        self.listener = Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                self.isAuth = true
            } else {
                self.isAuth = false
            }
        }
    }
    
    func stopListening() {
        Auth.auth().removeStateDidChangeListener(listener!)
    }
}
