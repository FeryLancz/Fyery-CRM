//
//  UnitsWidget.swift
//  FyeryPrototype
//
//  Created by Fery Lancz on 17.01.23.
//

import SwiftUI

struct UnitsWidget: View {
    @ObservedObject var user: SalesPartner
    
    var body: some View {
        TabView() {
            Text("a")
                .padding()
            Text("b")
                .padding()

            Text("c")
                .padding()

        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

struct UnitsWidget_Previews: PreviewProvider {
    static var previews: some View {
        UnitsWidget(user: SalesPartner(generateTestData: true))
    }
}
