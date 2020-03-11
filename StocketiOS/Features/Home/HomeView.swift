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
    @EnvironmentObject var user: User
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(named: "background")
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Balance")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                            .foregroundColor(Color("mainText"))
                        Text("\(self.user.data["portfolioValue"] as? String ?? "0.00")")
                            .font(.system(size: 30))
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
                    .padding(.top, 15)
                    Spacer()
                }
                .padding()
//                    WatchlistList()
                YourStocks()
                Spacer()
            }
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarHidden(true)
            .background(Color("background"))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(User())
    }
}
