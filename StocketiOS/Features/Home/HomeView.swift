//
//  HomeView.swift
//  StocketiOS
//
//  Created by Henry Paulino on 2/22/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Balance")
                        Text("$1,000")
                            .font(.title)
                    }
                    Spacer()
                }
                .padding()
                WatchlistList()
                YourStocks()
                Spacer()
            }
            .navigationBarTitle("Portfolio", displayMode: .large)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
