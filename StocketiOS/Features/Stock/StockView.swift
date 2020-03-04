//
//  StockView.swift
//  StocketiOS
//
//  Created by Henry Paulino on 3/1/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct StockView: View {
    var data: [String: String]
    
    init(data: [String: String]) {
        self.data = data
        print(data)
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                }
                LineGraph(name: self.data["name"]!, symbol: self.data["symbol"]!)
            }
            
            VStack(alignment: .leading) {
                Text("Stats")
                    .font(.system(size: 20, weight: .heavy))
                    .padding(.bottom, 20)
                HStack {
                    VStack {
                        StatsItem(label: "open", value: self.data["price_open"]!)
                        StatsItem(label: "high", value: self.data["day_high"]!)
                        StatsItem(label: "low", value: self.data["day_low"]!)
                        StatsItem(label: "52 WK high", value: self.data["52_week_high"]!)
                        StatsItem(label: "52 WK low", value: self.data["52_week_low"]!)
                    }
                    .padding(.trailing, 5)
                    VStack {
                        StatsItem(label: "vol", value: Int(self.data["volume"]!)!.formatUsingAbbrevation())
                        StatsItem(label: "avg vol", value: Int(self.data["volume_avg"]!)!.formatUsingAbbrevation())
                        StatsItem(label: "eps", value: self.data["eps"]!)
                        StatsItem(label: "shares", value: Int(self.data["shares"]!)!.formatUsingAbbrevation())
                        StatsItem(label: "mkt cap", value: Int(self.data["market_cap"]!)!.formatUsingAbbrevation())
                    }
                    .padding(.leading, 5)
                }
            }
            Spacer()
        }
        .padding()
    }
}

struct StockView_Previews: PreviewProvider {
    static var previews: some View {
        StockView(data: ["something": "else"])
    }
}
