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
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(named: "background")
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Balance")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(Color("mainText"))
                            Text("$1,000")
                                .font(.system(size: 26))
                                .fontWeight(.black)
                                .foregroundColor(Color("mainText"))
                                .padding(.top, 8)

                            
                            HStack {
                                Image(systemName: "arrow.up.right")
                                    .font(.system(size: 14, weight: .bold))
                                Text("$18.98 (8.57%)")
                                    .font(.system(size: 13, weight: .bold))
                            }
                            .foregroundColor(Color("green"))
                            .padding(.top, -3)
                        }
                        Spacer()
                    }
                    .padding()
                    WatchlistList()
                    YourStocks()
                    Spacer()
                }
                Spacer()
            }
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarHidden(true)
            .background(Color("background"))
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
