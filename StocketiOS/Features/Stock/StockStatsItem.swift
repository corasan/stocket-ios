//
//  StatsItem.swift
//  StocketiOS
//
//  Created by Henry Paulino on 3/2/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI

struct StockStatsItem: View {
    var label: String
    var value: String
    
    init(label: String = "Label", value: String = "10.9") {
        self.label = label
        self.value = value
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(self.label.capitalized)
                    .font(.system(size: 11, design: .rounded))
                    .foregroundColor(Color("subText"))
                Spacer()
                Text(self.value)
                    .font(.system(size: 11, design: .rounded))
                    .foregroundColor(Color("mainText"))
            }
        }
        .padding([.top, .bottom], 3)
    }
}

struct StockStatsItem_Previews: PreviewProvider {
    static var previews: some View {
        StockStatsItem()
    }
}
