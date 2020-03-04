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
    var value: String
    
    init(label: String = "Label", value: String = "10.9") {
        self.label = label
        self.value = value
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(self.label.uppercased())
                    .font(.system(size: 12, design: .rounded))
                    .foregroundColor(Color("subText"))
                Spacer()
                Text(self.value)
                    .font(.system(size: 12, design: .rounded))
                    .foregroundColor(Color("mainText"))
            }
            Divider()
        }
        .padding(.top, 4)
    }
}

struct StatsItem_Previews: PreviewProvider {
    static var previews: some View {
        StatsItem()
    }
}
