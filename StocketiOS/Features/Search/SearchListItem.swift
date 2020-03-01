//
//  SearchListItem.swift
//  StocketiOS
//
//  Created by Henry Paulino on 2/27/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI

struct SearchListItem: View {
    @EnvironmentObject var watchlist: Watchlist
    var name: String
    var symbol: String
    
    init(name: String, symbol: String) {
        self.name = name
        self.symbol = symbol
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(self.name)
                        .font(.system(size: 16, weight: .bold))
                    Text(self.symbol)
                        .font(.system(size: 15))
                        .foregroundColor(Color("subText"))
                }
                Spacer()
                Button(action: {
                    self.watchlist.addToWatchlist(symbol: self.symbol)
                }) {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 20))
                    .foregroundColor(Color("green"))
                }
                
            }
            .foregroundColor(Color("mainText"))

            Divider()
                .padding(.top, 10)
        }
    }
}

struct SearchListItem_Previews: PreviewProvider {
    static var previews: some View {
        SearchListItem(name: "Snap Inc.", symbol: "SNAP")
    }
}
