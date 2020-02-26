//
//  MainView.swift
//  Production
//
//  Created by Henry Paulino on 2/22/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var watchlist: Watchlist

    var body: some View {
        TabView {
            HomeView().tabItem({
                Image(systemName: "house.fill")
                    .font(.system(size: 26))
                })
            TradeView().tabItem({
                Image(systemName: "arrow.up.arrow.down")
                    .font(.system(size: 24))
            })
            SettingsView().tabItem({
                Image(systemName: "person.fill")
                    .font(.system(size: 26))
            })
        }
        .accentColor(Color("tabAccent"))
        .background(Color("background").edgesIgnoringSafeArea(.all))
        .onAppear(perform: self.watchlist.subscribe)
        .onDisappear(perform: self.watchlist.unsubscribe)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environment(\.colorScheme, .dark)
    }
}
