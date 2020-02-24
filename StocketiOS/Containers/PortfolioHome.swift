//
//  PortfolioHome.swift
//  StocketiOS
//
//  Created by Henry Paulino on 2/24/20.
//  Copyright © 2020 Henry Paulino. All rights reserved.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct PortfolioHome: View {
    @State var positions = [Position]()
    @State var listener: ListenerRegistration?

    var body: some View {
        VStack {
            ForEach(self.positions) { pos in
                PortfolioItem(position: pos)
            }
            Spacer()
        }
        .onAppear {
            Portfolio.subscribe { documents in
                for el in documents {
                    self.positions.append(el)
                }
            }
        }
        .onDisappear {
            self.listener?.remove()
        }
    }
}

struct PortfolioHome_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioHome()
    }
}
