//
//  StockView.swift
//  StocketiOS
//
//  Created by Henry Paulino on 3/1/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI

struct StockView: View {
    var symbol: String
    
    init(symbol: String) {
        self.symbol = symbol
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                }
                Text(self.symbol)
                    .font(.system(size: 24, weight: .heavy))
                Text("Company Inc.")
                    .font(.system(size: 18))
            }
            
            VStack(alignment: .leading) {
                Text("Stats")
                HStack {
                    VStack {
                        StatsItem(label: "open")
                        StatsItem(label: "high")
                        StatsItem(label: "low")
                        StatsItem(label: "52 WK high")
                        StatsItem(label: "52 WK low")
                        
                    }
                    VStack {
                        StatsItem(label: "vol")
                        StatsItem(label: "avg vol")
                        StatsItem(label: "p/e ratio")
                        StatsItem(label: "yield")
                        StatsItem(label: "mkt cap")
                    }
                }
            }
            Spacer()
        }
        .padding()
    }
}

struct StockView_Previews: PreviewProvider {
    static var previews: some View {
        StockView(symbol: "AAPL")
    }
}
