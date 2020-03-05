//
//  PortfolioItem.swift
//  StocketiOS
//
//  Created by Henry Paulino on 2/23/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI

struct WatchlistItem: View {
    @EnvironmentObject var stock: Stock

    var symbol: String
    var price: String
    var name: String
    var gains: String
    var changePct: String
    var data: [String: String]
    
    init(data: [String: String]) {
        self.data = data
        self.symbol = data["symbol"]!
        self.price = data["price"]!
        self.name = data["name"]!
        self.gains = data["day_change"]!
        self.changePct = data["change_pct"]!
    }
    
    var body: some View {
        NavigationLink(destination: StockView()) {
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
        .simultaneousGesture(TapGesture().onEnded {
            self.stock.selectStock(self.data)
        })
    }
}

struct WatchlistItem_Previews: PreviewProvider {
    static var data = [
        "id": "abc",
        "day_change": "10.00",
        "change_pct": "3.00",
        "symbol": "AAPL",
        "price": "298.87",
        "name": "Apple Inc."
    ]

    static var previews: some View {
        WatchlistItem(data: data)
    }
}
