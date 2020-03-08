//
//  TradeActionPicker.swift
//  StocketiOS
//
//  Created by Henry Paulino on 3/8/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI

struct TradeActionPicker: View {
    @Binding var pickerSelected: Int
    @EnvironmentObject var trade: Trade
    
    init(pickerSelected: Binding<Int>) {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "green")
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(named: "darkGreen")!], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(named: "subText")!], for: .normal)
        self._pickerSelected = pickerSelected
    }

    var body: some View {
        Picker(selection: $pickerSelected, label: Text("")) {
            Text("BUY").tag(0)
            Text("SELL").tag(1)
        }
        .pickerStyle(SegmentedPickerStyle())
        .frame(width: 180)
        .font(.system(size: 20, weight: .black))
        .padding(.top, 20)
    }
}

struct TradeActionPicker_Previews: PreviewProvider {
    @State static var pickerSelected = 0
    static var previews: some View {
        TradeActionPicker(pickerSelected: $pickerSelected)
    }
}
