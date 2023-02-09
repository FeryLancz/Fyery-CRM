//
//  MainTabView.swift
//  Fyery
//
//  Created by Fery Lancz on 01.02.23.
//

import SwiftUI

struct MainTabView: View {
    @ObservedObject var model: FyeryModel
    @State private var selection = 0
    var body: some View {
        TabView(selection: $selection) {
            TabItemView(title: "Dashboard", systemName: "display.2", idNumber: 0, content: AnyView(DashboardView()))
                .tag(0)
            TabItemView(title: "Prospects", systemName: "person.fill.viewfinder", idNumber: 1, content: AnyView(ProspectsView()))
                .tag(1)
            TabItemView(title: "Call", systemName: "phone", idNumber: 3, content: AnyView(CallView()))
                .tag(2)
            TabItemView(title: "Clients", systemName: "person.3.sequence.fill", idNumber: 2, content: AnyView(ClientView()))
                .tag(3)
            
            TabItemView(title: "Account", systemName: "slider.horizontal.2.square.on.square", idNumber: 4, content: AnyView(AccountView(model: model)))
                .tag(4)
        }
    }
}

struct TabItemView: View {
    let title: String
    let systemName: String
    let idNumber: Int
    var content: AnyView
    
    var body: some View {
        content
            .tabItem { Label(title, systemImage: systemName) }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(model: FyeryModel())
            .environmentObject(SalesPartner(generateTestData: true))
    }
}
