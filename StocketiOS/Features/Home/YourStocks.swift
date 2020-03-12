//
//  YourStocks.swift
//  StocketiOS
//
//  Created by Henry Paulino on 2/25/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI

struct YourStocks: View {
    @EnvironmentObject var portfolio: Portfolio
    
    func gainsColor(gains: Double) -> Color {
        if (gains == 0.00) {
            return Color("mainText")
        } else if (gains > 0.00) {
            return Color("green")
        } else {
            return Color("red")
        }
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("Stocks")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(Color("mainText"))
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(self.portfolio.data) { el in
                        VStack(alignment: .leading) {
                            Text("\(el.gainsPercentage)")
                                .font(.system(size: 24))
                                .fontWeight(.bold)
                                .padding(.bottom, 10)
                                .foregroundColor(self.gainsColor(gains: Double(el.gains)!))
                            Text(el.symbol)
                                .font(.system(size: 18, weight: .black))
                                .padding(.bottom, 2)
                        }
                        .frame(width: 128, height: 108)
                        .background(Color("subBackground"))
                        .cornerRadius(6)
                        .padding(.trailing, 10)
                    }
                }
            }
        }
        .padding()
        .padding(.top, 25)
        .onAppear {
            print(self.portfolio.data)
        }
    }
}

struct YourStocks_Previews: PreviewProvider {
    static let portfolio = Portfolio()

    static func getData() -> Portfolio {
        let data = Position(id: "1", gains: "50.53", gainsPercentage: "2.89", symbol: "MSFT", value: "$186.69")
        self.portfolio.data = [data]
        
        return self.portfolio
    }

    static var previews: some View {
        YourStocks().environmentObject(self.getData())
    }
}
