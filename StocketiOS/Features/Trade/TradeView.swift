//
//  TradeView.swift
//  StocketiOS
//
//  Created by Henry Paulino on 2/24/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI

struct TradeField: View {
    var label: String
    var value: String
    
    init(label: String, value: String) {
        self.label = label
        self.value = value
    }

    var body: some View {
        VStack {
            HStack {
                Text(label)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(Color("subText"))
                Spacer()
                Text(value)
                    .font(.system(size: 20, weight: .black))
            }
            Divider()
        }
    }
}

struct TradeView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 22, weight: .medium))
                        .foregroundColor(Color("green"))
                }
                Spacer()
                Text("Buy MSFT")
                    .font(.system(size: 24, weight: .black))
                    .foregroundColor(Color("mainText"))
                Spacer()
            }
            
            VStack {
                Group {
                    TradeField(label: "Price", value: "$186.97")
                    TradeField(label: "Shares", value: "0")
                }
                .padding(.top, 30)
                Spacer()
                TradeField(label: "Total", value: "0")
                NumPadView()
                    .frame(maxHeight: 250)
                Button(action: {
                    
                }) {
                    Text("BUY")
                        .font(.system(size: 20, weight: .black))
                        .foregroundColor(Color("darkGreen"))
                        .padding([.top, .bottom], 10)
                        .padding([.leading, .trailing], 100)
                        .background(Color("green"))
                        .cornerRadius(30)
                }
            }
        }
        .padding()
        .background(Color("background").edgesIgnoringSafeArea(.all))
    }
}

struct TradeView_Previews: PreviewProvider {
    static var previews: some View {
        TradeView()
    }
}
