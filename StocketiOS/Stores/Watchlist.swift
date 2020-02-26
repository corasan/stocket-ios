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

class Watchlist: ObservableObject {
    @Published var data = [[String: String]]()
    @State private var userWatchlistSymbols: [String] = [String]()
    private var watchlistListener: ListenerRegistration?
    
    private let db = Firestore.firestore().collection("Users")
    private let api = "https://api.worldtradingdata.com/api/v1/stock"
    private let apiKey = "UJe0U0CAY6QcikCVX5nXPtfxOCOnxrPlUQNWeeOZYiUanAhS4lXS3Z0yJaBa"
    
    func subscribe() {
        fetchUserWatchlist()
    }
    
    func unsubscribe() {
        self.watchlistListener?.remove()
    }
    
    private func fetchUserWatchlist() {
        let user = Auth.auth().currentUser
        if let user = user {
            let ref = db.document(user.uid).collection("watchlist")
            self.watchlistListener = ref.addSnapshotListener { snapshot, err in
                guard let documents = snapshot?.documents else {
                    print("Error fetching watchlist \(err?.localizedDescription ?? "Unknown Error")")
                    return
                }
                
                var symbols = [String]()
                for i in documents {
                    symbols.append(i.get("symbol") as! String)
                }
                
                if symbols.count > 0 {
                    self.fetchWatchlistData(symbols: symbols.joined(separator: ","))
                }
            }
        }
    }
    
    private func fetchWatchlistData(symbols: String) {
        AF.request("\(api)?symbol=\(symbols)&date=2019-01-02&api_token=\(apiKey)").responseJSON { response in
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
}
