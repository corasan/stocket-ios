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
    @EnvironmentObject var stock: Stock
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                    }
                    LineGraph(name: self.stock.selectedStock["name"]!, symbol: self.stock.selectedStock["symbol"]!)
                }
                
                VStack(alignment: .leading) {
                    Text("Stats")
                        .font(.system(size: 20, weight: .heavy))
                        .padding(.bottom, 20)
                    HStack {
                        VStack {
                            StatsItem(label: "open", value: self.stock.selectedStock["price_open"]!)
                            StatsItem(label: "high", value: self.stock.selectedStock["day_high"]!)
                            StatsItem(label: "low", value: self.stock.selectedStock["day_low"]!)
                            StatsItem(label: "52 WK high", value: self.stock.selectedStock["52_week_high"]!)
                            StatsItem(label: "52 WK low", value: self.stock.selectedStock["52_week_low"]!)
                        }
                        .padding(.trailing, 5)
                        VStack {
                            StatsItem(label: "vol", value: Int(self.stock.selectedStock["volume"]!)!.formatUsingAbbrevation())
                            StatsItem(label: "avg vol", value: Int(self.stock.selectedStock["volume_avg"]!)!.formatUsingAbbrevation())
                            StatsItem(label: "eps", value: self.stock.selectedStock["eps"]!)
                            StatsItem(label: "shares", value: Int(self.stock.selectedStock["shares"]!)!.formatUsingAbbrevation())
                            StatsItem(label: "mkt cap", value: Int(self.stock.selectedStock["market_cap"]!)!.formatUsingAbbrevation())
                        }
                        .padding(.leading, 5)
                    }
                }
                Spacer()
            }
            .padding(.all, 20)
            
            TradeOpenButton()
        }
    }
}

struct StockView_Previews: PreviewProvider {
    static var previews: some View {
        StockView()
    }
}
