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
    @ObservedObject var user = User()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: StocketUIColors.grayDarker]
//        UINavigationBar.appearance().backgroundColor = UIColor.black
    }

    var body: some View {
        NavigationView {
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
                Spacer()
                HStack {
                    Spacer()
                    PortfolioHome()
                    Spacer()
                }
                
            }
//            .background(Color.black.edgesIgnoringSafeArea(.all))
            .navigationBarTitle("Portfolio", displayMode: .large)
            .foregroundColor(.white)
        }
        .onAppear {
            self.user.getUserData()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
