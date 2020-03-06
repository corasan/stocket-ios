//
//  TradeOpenButton.swift
//  StocketiOS
//
//  Created by Henry Paulino on 3/4/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI

struct TradeOpenButton: View {
    @EnvironmentObject var trade: Trade

    var body: some View {
        VStack {
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    Text("Price")
                        .foregroundColor(Color("mainText"))
                        .font(.system(size: 13, weight: .medium))
                    Text("438.89")
                        .foregroundColor(Color("mainText"))
                        .font(.system(size: 14, weight: .medium))
                }
                Spacer()
                Button(action: {
                    self.trade.toggleModal(true)
                }) {
                    Text("Trade")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(Color("darkGreen"))
                        .padding([.top, .bottom], 8)
                        .padding([.leading, .trailing], 40)
                        .background(Color("green"))
                        .cornerRadius(16.0)
                }
            }
            .padding([.top, .bottom], 10)
            .padding([.leading, .trailing], 10)
            .background(Color("background"))
            .sheet(isPresented: $trade.showModal) {
                Text("trade")
            }
        }
    }
}

struct TradeOpenButton_Previews: PreviewProvider {
    static var previews: some View {
        TradeOpenButton().environmentObject(Trade())
    }
}
