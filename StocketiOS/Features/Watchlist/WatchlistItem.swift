//
//  PortfolioItem.swift
//  StocketiOS
//
//  Created by Henry Paulino on 2/23/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI

struct WatchlistItem: View {
    var symbol: String
    var price: String
    var name: String
    var gains: String
    var changePct: String
    
    init(symbol: String, price: String, name: String, gains: String, changePct: String) {
        self.symbol = symbol
        self.price = price
        self.name = name
        self.gains = gains
        self.changePct = changePct
    }
    
    var body: some View {
        NavigationLink(destination: StockView(symbol: self.symbol)) {
            VStack {
                HStack {
                    Text(self.symbol)
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                    Spacer()
                    Text("\(self.price)")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                }
                HStack {
                    Text(self.name)
                        .foregroundColor(Color("subText"))
                        .padding(.top, 5)
                    Spacer()
                    Text("\(Double(self.gains)! > 0 ? "+" : "")\(self.gains)") // (\(self.changePct)%)
                        .foregroundColor(Double(self.gains)! > 0 ? Color("green") : Color("red"))
                        .padding(.top, 5)
                        
                }
            }
            .foregroundColor(Color("mainText"))
            .padding([.top, .bottom], 10)
        }
    }
}

struct WatchlistItem_Previews: PreviewProvider {
    static var pos = Position(
        id: "abc",
        gains: "10.00",
        gainsPercentage: "3.00",
        symbol: "AAPL",
        value: "298.87"
    )

    static var previews: some View {
        PortfolioItem(position: pos)
    }
}
