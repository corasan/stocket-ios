//
//  Watchlist.swift
//  StocketiOS
//
//  Created by Henry Paulino on 2/26/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI
import Alamofire

class Watchlist: ObservableObject {
    @Published var data = [[String: String]]()
    
    func loadData() {
        let api = "https://api.worldtradingdata.com/api/v1/stock"
        let apiKey = "UJe0U0CAY6QcikCVX5nXPtfxOCOnxrPlUQNWeeOZYiUanAhS4lXS3Z0yJaBa"
        
        AF.request("\(api)?symbol=AAPL,MSFT&date=2019-01-02&api_token=\(apiKey)").responseJSON { response in
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
