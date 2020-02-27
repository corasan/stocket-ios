//
//  WatchlistSearchItem.swift
//  StocketiOS
//
//  Created by Henry Paulino on 2/26/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI

struct WatchlistSearchItem: View {
    var name: String
    var symbol: String
    var price: String
    var stockExchange: String
    
    init(name: String, symbol: String, price: String, stockExchange: String) {
        self.name = name
        self.symbol = symbol
        self.price = price
        self.stockExchange = stockExchange
    }
    
    var body: some View {
        Button(action: {
            print("pressed")
        }) {
            VStack {
                HStack {
                    Text(self.symbol)
                        .font(.system(size: 15))
                        .fontWeight(.heavy)
                    Spacer()
                    Text("\(self.price)")
                        .font(.system(size: 15))
                        .fontWeight(.heavy)
                }
                HStack {
                    Text(self.name)
                        .foregroundColor(Color("subText"))
                        .padding(.top, 5)
                    Spacer()
                    Text(self.stockExchange)
                        .foregroundColor(Color("subText"))
                        .padding(.top, 5)
                        
                }
            }
            .foregroundColor(Color("mainText"))
            .padding([.top, .bottom], 10)
        }
    }
}

struct WatchlistSearchItem_Previews: PreviewProvider {
    static var previews: some View {
        WatchlistSearchItem(name: "Snap Inc.", symbol: "SNAP", price: "15.90", stockExchange: "NYSE")
    }
}
