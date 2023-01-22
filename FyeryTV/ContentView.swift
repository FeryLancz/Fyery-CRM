//
//  ContentView.swift
//  FyeryTV
//
//  Created by Fery Lancz on 21.01.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            DashboardGreetingView(user: SalesPartner())
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
