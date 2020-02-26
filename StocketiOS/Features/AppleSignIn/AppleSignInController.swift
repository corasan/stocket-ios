//
//  AppleSignInController.swift
//  Twitta
//
//  Created by Henry Paulino on 2/21/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI
import AuthenticationServices

struct AppleSignInController: UIViewRepresentable {
    typealias UIViewType = ASAuthorizationAppleIDButton
    var window: UIWindow = UIWindow()
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(type: .default, style: colorScheme == .light ? .black : .white)
    }
    
    func updateUIView(_ uiViewController: ASAuthorizationAppleIDButton, context: Context) { }
}
