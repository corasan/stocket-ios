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
                
//                VStack(alignment: .leading) {
//                    StockStats(data: self.stock.selectedStock)
//                }
                Spacer()
            }
            .padding(.all, 20)
            
            TradeOpenButton(symbol: self.stock.selectedStock["symbol"]!, price: self.stock.selectedStock["price"]!)
        }
        .background(Color("background"))
    }
}

#if DEBUG
struct StockView_Previews: PreviewProvider {
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
//        self.stock.selectedStock = data
        return self.stock
    }

    static var previews: some View {
        StockView().environmentObject(getData()).environmentObject(Trade())
    }
}
#endif
