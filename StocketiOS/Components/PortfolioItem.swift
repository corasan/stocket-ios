//
//  PortfolioItem.swift
//  StocketiOS
//
//  Created by Henry Paulino on 2/23/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI

struct PortfolioItem: View {
    var position: Position
    
    init(position: Position) {
        self.position = position
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(self.position.symbol)
                    .font(.headline)
                Spacer()
                Text("$\(self.position.value)")
                    .font(.headline)
            }
            HStack {
//                Text("Microsoft")
//                    .font(.subheadline)
//                    .padding(.top, 5)
//                    .foregroundColor(StocketColors.grayDarker)
                Spacer()
                Text("$\(self.position.gains) (\(self.position.gainsPercentage)%)")
                    .font(.subheadline)
                    .foregroundColor(StocketColors.green)
                    
            }
        }
        .foregroundColor(Color("mainText"))
        .padding()
    }
}

struct PortfolioItem_Previews: PreviewProvider {
    static var pos = Position(
        id: "abc",
        gains: "10.00",
        gainsPercentage: "3.00",
        symbol: "AAPL",
        value: "298.87"
    )

    static var previews: some View {
        PortfolioItem(position: pos)
    }
}
