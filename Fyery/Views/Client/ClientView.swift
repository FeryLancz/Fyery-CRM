//
//  ClientView.swift
//  Fyery
//
//  Created by Fery Lancz on 26.12.22.
//

import SwiftUI

struct ClientView: View {
    @EnvironmentObject var model: FyeryModel
    
    var body: some View {
        NavigationView {
            List(model.user.clients) { client in
                ClientCellView(client: client)
            }
        }
    }
}

struct ClientView_Previews: PreviewProvider {
    
    static var previews: some View {
        ClientView()
            .environmentObject(FyeryModel())
    }
}

struct ClientCellView: View {
    @ObservedObject var client: Prospect
    
    var body: some View {
        Text(client.fullName)
    }
}
