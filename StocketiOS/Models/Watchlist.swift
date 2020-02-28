//
//  Watchlist.swift
//  StocketiOS
//
//  Created by Henry Paulino on 2/26/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI
import Alamofire
import FirebaseFirestore
import FirebaseAuth
import Combine

class Watchlist: ObservableObject {
    @Published var data = [[String: String]]()
    @Published var searchResults = [[String: String]]()
    @Published var search = ""
    @State private var userWatchlistSymbols: [String] = [String]()
    private var watchlistListener: ListenerRegistration?
    private var cancellable: AnyCancellable? = nil
    
    init() {
       cancellable = $search
        .debounce(for: 0.5, scheduler: DispatchQueue.main)
        .removeDuplicates()
        .sink { searchText in
            print("im hereeee")
            self.search(searchTerm: searchText)
        }
    }
    
    private let db = Firestore.firestore().collection("Users")
    private let stocksApi = "https://api.worldtradingdata.com/api/v1/stock"
    private let apiKey = "UJe0U0CAY6QcikCVX5nXPtfxOCOnxrPlUQNWeeOZYiUanAhS4lXS3Z0yJaBa"
    private let searchApi = "https://api.worldtradingdata.com/api/v1/stock_search"
    
    func subscribe() {
        fetchUserWatchlist()
    }
    
    func unsubscribe() {
        watchlistListener?.remove()
    }
    
    func search(searchTerm: String) {
        if (searchTerm.count > 0) {
            searchSymbolData(searchTerm: searchTerm)
        } else {
            self.searchResults = []
        }
    }
    
    func addToWatchlist(symbol: String) {
        addToUserWatchlist(symbol: symbol)
    }
    
    private func fetchUserWatchlist() {
        let user = Auth.auth().currentUser
        if let user = user {
            let ref = db.document(user.uid).collection("watchlist")
            self.watchlistListener = ref.addSnapshotListener { snapshot, err in
                guard let snap = snapshot else {
                    print("Error fetching watchlist \(err?.localizedDescription ?? "Unknown Error")")
                    return
                }

                var symbols = [String]()
                snap.documentChanges.forEach { diff in
                    if (diff.type == .added) {
                        symbols.append(diff.document.get("symbol") as! String)
                    }
                }
                
                if symbols.count > 0 {
                    self.fetchWatchlistData(symbols: symbols.joined(separator: ","))
                }
            }
        }
    }
    
    private func fetchWatchlistData(symbols: String) {
        let query = "\(stocksApi)?symbol=\(symbols)"
        AF.request("\(query)&api_token=\(apiKey)").responseJSON { response in
            switch response.result {
            case let .success(result):
                let res = result as! [String: Any]
                for i in res["data"] as! [[String: String]] {
                    self.data.append(i)
                }
            case let .failure(err):
                print(err)
            }
        }
    }
    
    private func searchSymbolData(searchTerm: String) {
        let query = "\(searchApi)?search_term=\(searchTerm)&search_by=symbol,name&currency=USD"
        AF.request("\(query)&api_token=\(apiKey)").responseJSON { response in
            switch response.result {
            case let .success(result):
                let res = result as! [String: Any]
                self.searchResults = []
                for i in res["data"] as! [[String: String]] {
                    self.searchResults.append(i)
                }
            case let .failure(err):
                print(err)
            }
        }
    }
    
    private func addToUserWatchlist(symbol: String) {
        if let user = Auth.auth().currentUser {
            let ref = db.document(user.uid).collection("watchlist")
            ref.addDocument(data: ["symbol": symbol]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                }
            }
        }
    }
}
