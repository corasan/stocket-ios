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
    var symbol: String
    var price: String
    
    init(symbol: String, price: String) {
        self.symbol = symbol
        self.price = price
    }

    var body: some View {
        VStack {
            Spacer()
            HStack {
                HStack {
                    Text(self.symbol)
                        .foregroundColor(Color("mainText"))
                        .font(.system(size: 14, weight: .medium))
                    Text(self.price)
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
    static var previews: some View {
        TradeOpenButton(symbol: "MSFT", price: "186.97")
            .environmentObject(Trade())
    }
}
