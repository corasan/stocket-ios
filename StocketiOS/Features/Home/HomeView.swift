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
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Balance")
                                .font(.system(size: 25))
                                .fontWeight(.heavy)
                                .foregroundColor(Color("mainText"))
                            Text("$1,000")
                                .font(.system(size: 25))
                                .fontWeight(.heavy)
                                .foregroundColor(Color("mainText"))

                            
                            HStack {
                                Image(systemName: "arrow.up.right")
                                    .font(.system(size: 14, weight: .bold))
                                Text("$18.98 (8.57%)")
                                    .font(.system(size: 13, weight: .bold))
                            }
                            .foregroundColor(Color("green"))
                        }
                        Spacer()
                    }
                    .padding()
                    WatchlistList()
                    YourStocks()
                    Spacer()
                }
                .background(Color("background"))
            }
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
