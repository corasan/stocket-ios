//
//  LoginView.swift
//  Production
//
//  Created by Henry Paulino on 2/22/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            Spacer()
            Image("StocketLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150.0)
            Spacer()
            HStack {
                Spacer()
                
                AppleSignIn()
                    .frame(width: 220, height: 50)
                Spacer()
            }
            Spacer()
        }
        .background(Color("background").edgesIgnoringSafeArea(.all))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environment(\.colorScheme, .dark)
    }
}
