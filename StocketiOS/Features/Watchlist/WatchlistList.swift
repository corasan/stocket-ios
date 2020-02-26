//
//  WatchlistContainer.swift
//  StocketiOS
//
//  Created by Henry Paulino on 2/25/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI
import Alamofire

struct WatchlistList: View {
    @EnvironmentObject var watchlist: Watchlist
    @State var showModal: Bool = false

    var body: some View {
        VStack {
            HStack {
                Text("Watchlist")
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
                    .foregroundColor(Color("mainText"))
                    .padding(.bottom, 10)
                Spacer()
                Button(action: {
                    self.showModal = true
                }) {
                    Text("Add")
                        .foregroundColor(Color.blue)
                }
            }
            
            ForEach(self.watchlist.data, id: \.self) { stock in
                WatchlistItem(symbol: stock["symbol"]!, price: stock["price"]!, name: stock["name"]!, gains: stock["day_change"]!, changePct: stock["change_pct"]!)
            }
        }
        .padding()
    }
}

struct WatchlistList_Previews: PreviewProvider {
    static var previews: some View {
        WatchlistList().environmentObject(Watchlist())
    }
}
