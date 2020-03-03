//
//  StatsItem.swift
//  StocketiOS
//
//  Created by Henry Paulino on 3/2/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI

struct StatsItem: View {
    var label: String
    
    init(label: String = "Label") {
        self.label = label
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(self.label.uppercased())
                    .font(.system(size: 13, design: .rounded))
                    .foregroundColor(Color("subText"))
                Spacer()
                Text("14.90")
                    .font(.system(size: 14, design: .rounded))
                    .foregroundColor(Color("mainText"))
            }
            Divider()
        }
    }
}

struct StatsItem_Previews: PreviewProvider {
    static var previews: some View {
        StatsItem()
    }
}
