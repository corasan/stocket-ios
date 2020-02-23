//
//  ContentView.swift
//  StocketiOS
//
//  Created by Henry Paulino on 2/22/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State var isAuth: Bool = false
    @State var authStatehandle: AuthStateDidChangeListenerHandle?
    
    var body: some View {
        Group {
            Text("Hello, World!")
        }
        .onAppear {
            self.authStatehandle = Auth.auth().addStateDidChangeListener { (auth, user) in
                if user != nil {
                    self.isAuth = true
                } else {
                    self.isAuth = false
                }
            }
        }
        .onDisappear {
            Auth.auth().removeStateDidChangeListener(self.authStatehandle!)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
