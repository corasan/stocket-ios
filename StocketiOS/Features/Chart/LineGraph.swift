//
//  LineGraph.swift
//  StocketiOS
//
//  Created by Henry Paulino on 3/3/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct LineGraph: View {
    var name: String
    var symbol: String
    
    let style = ChartStyle(backgroundColor: Color.clear, accentColor: Color.red, secondGradientColor: Color.blue, textColor: Color("mainText"), legendTextColor: Color("subText"))
    
    init(name: String, symbol: String) {
        self.name = name
        self.symbol = symbol
    }
    
    var body: some View {
        VStack {
            GeometryReader { g in
                Group {
                    LineView(data: [8,23,54,32,12,37,7,23,43], title: self.name, legend: self.symbol, style: self.style)
                }
            }
            .frame(height: 390)
        }
    }
}

//struct LineGraph_Previews: PreviewProvider {
//    static var previews: some View {
//        LineGraph()
//    }
//}
