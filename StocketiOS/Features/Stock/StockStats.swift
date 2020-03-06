//
//  StockStats.swift
//  StocketiOS
//
//  Created by Henry Paulino on 3/5/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI

struct StockStats: View {
    var data: [String: String]
    
    init(data: [String: String]) {
        self.data = data
    }

    var body: some View {
        HStack {
            VStack {
                StockStatsItem(label: "open", value: self.data["price_open"]!)
                StockStatsItem(label: "high", value: self.data["day_high"]!)
                StockStatsItem(label: "low", value: self.data["day_low"]!)
            }
            Divider()
                .padding(.all, 1)
            VStack {
                StockStatsItem(label: "52 WK h", value: self.data["52_week_high"]!)
                StockStatsItem(label: "52 WK l", value: self.data["52_week_low"]!)
                StockStatsItem(label: "cap", value: Int(self.data["market_cap"]!)!.formatUsingAbbrevation())
            }
            Divider()
                .padding(.all, 1)
            VStack {
                StockStatsItem(label: "vol", value: Int(self.data["volume"]!)!.formatUsingAbbrevation())
                StockStatsItem(label: "avg vol", value: Int(self.data["volume_avg"]!)!.formatUsingAbbrevation())
                StockStatsItem(label: "eps", value: self.data["eps"]!)
            }
        }
    }
}

struct StockStats_Previews: PreviewProvider {
    static var stock = Stock()

    static func getData() -> [String: String] {
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
        return data
    }

    static var previews: some View {
        StockStats(data: getData())
    }
}
