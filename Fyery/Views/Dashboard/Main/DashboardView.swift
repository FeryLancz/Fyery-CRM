//
//  DashboardView.swift
//  Fyery
//
//  Created by Fery Lancz on 26.12.22.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var user: SalesPartner
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                DashboardGreetingView(name: $user.firstName)
                    .customAlign(.leading)
            }
            .padding(15)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    PrimaryHeader(title: "Dashboard", logoSystemName: "display")
                }
            }
            .applyBackground()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .environmentObject(SalesPartner(generateTestData: true))
    }
}
