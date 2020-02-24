//
//  PortfolioItem.swift
//  StocketiOS
//
//  Created by Henry Paulino on 2/23/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI

struct PortfolioItem: View {
//    var item: Dictionary<String, Any>
//
//    init(item: Dictionary<String, Any>) {
//        self.item = item
//    }
    
    var body: some View {
        VStack {
            HStack {
                Text("MSFT")
                    .font(.headline)
                Spacer()
                Text("$1,000")
                    .font(.headline)
            }
            HStack {
                Text("Microsoft")
                    .font(.subheadline)
                    .padding(.top, 5)
                    .foregroundColor(StocketColors.grayDarker)
                Spacer()
                Text("$30.5 (3%)")
                    .font(.subheadline)
                    .foregroundColor(StocketColors.green)
                    
            }
        }
        .foregroundColor(StocketColors.gray)
        .padding()
        .background(Color.black)
//        .border()
    }
}

struct PortfolioItem_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioItem()
    }
}
