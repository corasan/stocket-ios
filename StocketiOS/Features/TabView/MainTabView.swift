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
                Image(systemName: "arrow.up.arrow.down")
                    .font(.system(size: 26, weight: .semibold ))
            })
            .background(Color("background"))
            SearchView().tabItem({
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 26))
            })
            .background(Color("background"))
            SettingsView().tabItem({
                Image(systemName: "person.fill")
                    .font(.system(size: 26))
            })
            .background(Color("background"))
        }
        .accentColor(Color("tabAccent"))
        .onAppear(perform: self.watchlist.subscribe)
        .onDisappear(perform: self.watchlist.unsubscribe)
        .background(Color("background").edgesIgnoringSafeArea(.all))
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(Watchlist())
    }
}
