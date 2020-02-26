//
//  TradeView.swift
//  StocketiOS
//
//  Created by Henry Paulino on 2/24/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI

struct TradeView: View {
    @State var search: String = ""

    var body: some View {
        VStack {
            HStack {
                TextField("Search Symbol", text: $search)
                    .font(.system(size: 20))
                Spacer()
                Button(action: {
                    print("pressed search")
                }) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 22))
                        .foregroundColor(StocketColors.blackLight)
                }
                
            }
            .padding()
            .background(StocketColors.gray)
            .cornerRadius(14)
            
            Spacer()
        }
        .padding()
//        .background(Color.red)
    }
}

struct TradeView_Previews: PreviewProvider {
    static var previews: some View {
        TradeView()
    }
}
