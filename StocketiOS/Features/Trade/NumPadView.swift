//
//  NumPadView.swift
//  StocketiOS
//
//  Created by Henry Paulino on 3/7/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI

struct NumPadView: View {
    @EnvironmentObject var trade: Trade

    var body: some View {
        GeometryReader { g in
            VStack(alignment: .trailing, spacing: 25) {
                ForEach(pad) { padRow in
                    HStack {
                        ForEach(padRow.row) { padKey in
                            Button(action: {
                                if (padKey.value == "delete.left") {
                                    if (self.trade.shares.count != 0) {
                                        self.trade.shares.removeLast()
                                    }
                                } else {
                                    self.trade.shares.append(padKey.value)
                                }
                            }) {
                                if padKey.value == "delete.left" {
                                    Image(systemName: padKey.value)
                                        .font(.system(size: 28, weight: .regular))
                                } else {
                                    Text(padKey.value)
                                        .font(.system(size: 28, weight: .regular))
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width / 3)
                        }
                    }
                    
                }
                .foregroundColor(Color("green"))
            }
        }
    }
}

let pad = [
    PadRow(id: 0, row: [PadKey(id: 0, value: "1"), PadKey(id: 1, value: "2"), PadKey(id: 2, value: "3")]),
    PadRow(id: 1, row: [PadKey(id: 0, value: "4"), PadKey(id: 1, value: "5"), PadKey(id: 3, value: "6")]),
    PadRow(id: 2, row: [PadKey(id: 0, value: "7"), PadKey(id: 1, value: "8"), PadKey(id: 3, value: "9")]),
    PadRow(id: 3, row: [PadKey(id: 0, value: "0"), PadKey(id: 1, value: "delete.left")])
]

struct PadRow: Identifiable {
    var id: Int
    var row: [PadKey]
}

struct PadKey: Identifiable {
    var id: Int
    var value: String
}

#if DEBUG
struct NumPadView_Previews: PreviewProvider {
    @State static var number: [String] = []
    static var previews: some View {
        NumPadView()
    }
}
#endif
