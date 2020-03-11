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
    @EnvironmentObject var user: User
    
    func signout() {
        do {
            try Auth.auth().signOut()
        } catch let err as NSError {
            print("Sign out Error: \(err)")
        }
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
            }
            Group {
                Text("Cash")
                    .font(.system(size: 20, weight: .bold))
                Text(self.user.data["cash"] as? String ?? "$0.00")
                    .font(.system(size: 26, weight: .black))
                Spacer()
            }
            Spacer()
            Button(action: self.signout) {
                Text("Sign out")
                    .foregroundColor(Color.red)
            }
        }
        .padding()
        .background(Color("background").edgesIgnoringSafeArea(.all))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environment(\.colorScheme, .dark).environmentObject(User())
    }
}
