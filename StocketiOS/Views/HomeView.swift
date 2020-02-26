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
//    @ObservedObject var user = User()

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
                WatchlistContainer()
                YourStocks()
                Spacer()
            }
            .navigationBarTitle("Portfolio", displayMode: .large)
            .background(Color("background").edgesIgnoringSafeArea(.all))
        }
        
//        .onAppear {
//            self.user.getUserData()
//        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environment(\.colorScheme, .dark)
    }
}
