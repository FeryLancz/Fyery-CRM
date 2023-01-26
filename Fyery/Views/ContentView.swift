//
//  ContentView.swift
//  Fyery
//
//  Created by Fery Lancz on 26.12.22.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    var body: some View {
        TabView(selection: $selection) {
            TabItemView(title: "Dashboard", systemName: "display.2", idNumber: 0, content: AnyView(DashboardView()))
                .tag(0)
            TabItemView(title: "Prospects", systemName: "person.fill.viewfinder", idNumber: 1, content: AnyView(ProspectsView()))
                .tag(1)
            TabItemView(title: "Clients", systemName: "person.3.sequence.fill", idNumber: 2, content: AnyView(ClientView()))
                .tag(2)
            TabItemView(title: "SPs", systemName: "person.text.rectangle", idNumber: 3, content: AnyView(SalesPartnerView()))
                .tag(3)
            TabItemView(title: "Account", systemName: "slider.horizontal.2.square.on.square", idNumber: 4, content: AnyView(AccountView()))
                .tag(4)
        }
    }
}

struct TabItemView: View {
    let title: String
    let systemName: String
    let idNumber: Int
    let content: AnyView
    
    var body: some View {
        content
            .tabItem { Label(title, systemImage: systemName) }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SalesPartner())
    }
}
