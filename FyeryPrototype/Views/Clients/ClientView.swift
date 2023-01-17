//
//  ClientView.swift
//  FyeryPrototype
//
//  Created by Fery Lancz on 26.12.22.
//

import SwiftUI

struct ClientView: View {
    @EnvironmentObject private var user: SalesPartner
    
    var body: some View {
        NavigationView {
            List(user.prospects.filter { $0.isCustomer }) { client in
                ClientCellView(client: client)
            }
        }
    }
}

struct ClientView_Previews: PreviewProvider {
    
    static var previews: some View {
        ClientView()
            .environmentObject(SalesPartner(generateTestData: true))
    }
}

struct ClientCellView: View {
    @ObservedObject var client: Prospect
    
    var body: some View {
        Text(client.fullName)
    }
}
