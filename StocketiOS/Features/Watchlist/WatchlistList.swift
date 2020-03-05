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
            }
            
            ForEach(self.watchlist.data, id: \.self) { el in
                WatchlistItem(data: el)
            }
        }
        .padding()
        .sheet(isPresented: $showModal, content: { WatchlistSearch().environmentObject(self.watchlist) })
    }
}

struct WatchlistList_Previews: PreviewProvider {
    static var previews: some View {
        WatchlistList().environmentObject(Watchlist())
    }
}
