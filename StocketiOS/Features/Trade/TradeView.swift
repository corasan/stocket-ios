//
//  TradeView.swift
//  StocketiOS
//
//  Created by Henry Paulino on 2/24/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI

struct TradeField: View {
    var label: String
    var value: String
    
    init(label: String, value: String) {
        self.label = label
        self.value = value
    }

    var body: some View {
        VStack {
            HStack {
                Text(label)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(Color("subText"))
                Spacer()
                Text(value)
                    .font(.system(size: 20, weight: .black))
            }
            Divider().frame(height: 0.5)
        }
    }
}

struct TradeView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var trade: Trade
    @EnvironmentObject var stock: Stock
    
    func getTotal() -> String {
        let result = Double(getSharesNumber())! * Double(self.stock.selectedStock["price"]!)!
        return String(format: "%.2f",result)
    }
    
    func getSharesNumber() -> String {
        return self.trade.shares.count == 0 ? "0" : self.trade.shares.joined(separator: "")
    }

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 22, weight: .medium))
                        .foregroundColor(Color("green"))
                }
                Spacer()
                Text("Buy \(self.stock.selectedStock["symbol"]!)")
                    .font(.system(size: 24, weight: .black))
                    .foregroundColor(Color("mainText"))
                Spacer()
            }
            
            VStack {
                Group {
                    TradeField(label: "Price", value: self.stock.selectedStock["price"]!)
                    TradeField(label: "Shares", value: getSharesNumber())
                }
                .padding(.top, 30)
                Spacer()
                TradeField(label: "Total", value: getTotal())
                NumPadView()
                    .frame(maxHeight: 250)
                Button(action: {
                    
                }) {
                    Text("BUY")
                        .font(.system(size: 20, weight: .black))
                        .foregroundColor(Color("darkGreen"))
                        .padding(.vertical, 12)
                        .padding(.horizontal, 110)
                        .background(Color("green"))
                        .cornerRadius(30)
                }
            }
        }
        .padding()
        .background(Color("background").edgesIgnoringSafeArea(.all))
    }
}

struct TradeView_Previews: PreviewProvider {
    static var stock = Stock()

    static func getData() -> Stock {
        let data = [
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
        self.stock.selectStock(data)
        return self.stock
    }

    static var previews: some View {
        TradeView().environmentObject(Trade()).environmentObject(getData())
    }
}
