//
//  YourStocks.swift
//  StocketiOS
//
//  Created by Henry Paulino on 2/25/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI

struct YourStocks: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your Stocks")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(Color("mainText"))
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(1...3, id: \.self) { item in
                        VStack(alignment: .leading) {
                            Text("-1.6%")
                                .font(.system(size: 24))
                                .fontWeight(.bold)
                                .padding(.bottom, 10)
                                .foregroundColor(Color("red"))
                            Text("Microsoft")
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                                .padding(.bottom, 2)
                            Text("MSFT")
                                .font(.system(size: 14))
                            .foregroundColor(Color("subText"))
                        }
                        
                        .frame(width: 128, height: 108)
                        
                        .background(Color("subBackground"))
                        .cornerRadius(6)
                        .padding([.leading, .trailing], 5)
                    }
                    .foregroundColor(Color("mainText"))
                }
            }
        }
        .padding()
        .padding(.top, 25)
    }
}

struct YourStocks_Previews: PreviewProvider {
    static var previews: some View {
        YourStocks()
    }
}
