//
//  SettingsView.swift
//  StocketiOS
//
//  Created by Henry Paulino on 2/24/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI
import FirebaseAuth

struct SettingsView: View {
    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                do {
                    try Auth.auth().signOut()
                } catch let err as NSError {
                    print("Sign out Error: \(err)")
                }
            }) {
                Text("Sign out")
                    .foregroundColor(Color.red)
            }
        }
        .padding()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
