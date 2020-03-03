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
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    }
    
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
