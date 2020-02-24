//
//  MainView.swift
//  Production
//
//  Created by Henry Paulino on 2/22/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView().tabItem({
                Text("Home")
            })
        }
        .background(Color("background").edgesIgnoringSafeArea(.all))
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
