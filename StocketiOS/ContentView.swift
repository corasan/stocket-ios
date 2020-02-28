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
    @ObservedObject var authState = AuthState()
    var watchlist = Watchlist()
    var authStatehandle: AuthStateDidChangeListenerHandle?
    
    var body: some View {
        Group {
            if !authState.isAuth {
                LoginView()
            } else {
                MainTabView().environmentObject(watchlist)
            }
        }
        .onAppear {
            self.authState.listen()
        }
        .onDisappear {
            self.authState.stopListening()
        }
        .background(Color("background").edgesIgnoringSafeArea(.all))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.colorScheme, .dark)
    }
}
