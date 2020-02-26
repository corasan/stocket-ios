//
//  WatchlistContainer.swift
//  StocketiOS
//
//  Created by Henry Paulino on 2/25/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI
import Alamofire

struct WatchlistContainer: View {
    @State var stocks = [[String: String]]()
    var body: some View {
        VStack {
            HStack {
                Text("Watchlist")
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
                    .foregroundColor(Color("mainText"))
                    .padding(.bottom, 10)
                Spacer()
            }
            
            ForEach(stocks, id: \.self) { stock in
                WatchlistItem(symbol: stock["symbol"]!, price: stock["price"]!, name: stock["name"]!, gains: stock["day_change"]!, changePct: stock["change_pct"]!)
            }
        }
        .padding()
        .onAppear(perform: loadData)
    }

    func loadData() {
        let api = "https://api.worldtradingdata.com/api/v1/stock"
        let apiKey = "UJe0U0CAY6QcikCVX5nXPtfxOCOnxrPlUQNWeeOZYiUanAhS4lXS3Z0yJaBa"
        
        AF.request("\(api)?symbol=AAPL,MSFT&date=2019-01-02&api_token=\(apiKey)").responseJSON { response in
            switch response.result {
            case let .success(result):
                let res = result as! [String: Any]
                for i in res["data"] as! [[String: String]] {
                    self.stocks.append(i)
                    print(self.stocks)
                }
            case let .failure(err):
                print(err)
            }
        }
    }
}

struct WatchlistContainer_Previews: PreviewProvider {
    static var previews: some View {
        WatchlistContainer()
    }
}
