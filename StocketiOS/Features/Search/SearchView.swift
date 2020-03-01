//
//  SearchView.swift
//  StocketiOS
//
//  Created by Henry Paulino on 2/27/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI
import Combine

struct SearchView: View {
    @State var search: String = ""
    @EnvironmentObject var watchlist: Watchlist
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView {
            HStack {
                HStack {
                    TextField("Search Symbol", text: $watchlist.search)
                        .font(.system(size: 18))
                        .padding(10)
                    Spacer()
//                    Button(action: {
//                        self.watchlist.search(searchTerm: self.search)
//                    }) {
//                        Image(systemName: "magnifyingglass")
//                            .font(.system(size: 20))
//                        .foregroundColor(Color("subText"))
//                    }
                }
                .padding(.trailing)
                .background(Color("subBackground"))
                .cornerRadius(10.0)
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                        .font(.system(size: 15))
                }
            }
            
            if self.watchlist.searchResults.count > 0 {
                ForEach(self.watchlist.searchResults, id: \.self) { item in
                    SearchListItem(name: item["name"]!, symbol: item["symbol"]!)
                }
            }
            Spacer()
        }
        .padding()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
