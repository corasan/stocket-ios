//
//  TradeOpenButton.swift
//  StocketiOS
//
//  Created by Henry Paulino on 3/4/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI

struct TradeOpenButton: View {
    @EnvironmentObject var trade: Trade
    @EnvironmentObject var stock: Stock

    var body: some View {
        VStack {
            Spacer()
            HStack {
                HStack {
                    Text(self.stock.selectedStock["symbol"]!)
                        .foregroundColor(Color("mainText"))
                        .font(.system(size: 14, weight: .medium))
                    Text(self.stock.selectedStock["price"]!)
                        .foregroundColor(Color("mainText"))
                        .font(.system(size: 16, weight: .black))
                }
                Spacer()
                Button(action: {
                    self.trade.toggleModal(true)
                }) {
                    Text("Trade")
                        .font(.system(size: 16, weight: .black))
                        .foregroundColor(Color("darkGreen"))
                        .padding(.vertical, 10)
                        .padding(.horizontal, 40)
                        .background(Color("green"))
                        .cornerRadius(20.0)
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 10)
            .background(Color("background"))
            .sheet(isPresented: $trade.showModal) {
                TradeView()
                    .environmentObject(self.trade)
                    .environmentObject(self.stock)
            }
        }
    }
}

struct TradeOpenButton_Previews: PreviewProvider {
    static let data = [
        "name": "Snap Inc.",
        "symbol": "SNAP",
        "price": "14.39",
        "price_open": "14.35",
        "day_high": "14.53",
        "day_low": "13.75",
        "52_week_high": "19.76",
        "52_week_low": "9.16",
        "market_cap": "20436533248",
        "volume": "27084322",
        "volume_avg": "25158083",
        "shares": "1160130048",
        "eps": "-0.75"
    ]
    
    static var previews: some View {
        TradeOpenButton()
            .environmentObject(Trade())
            .environmentObject(Stock())
    }
}
