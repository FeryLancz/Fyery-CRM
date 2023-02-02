//
//  AccountView.swift
//  Fyery
//
//  Created by Fery Lancz on 26.12.22.
//

import SwiftUI

struct AccountView: View {
    @ObservedObject var model: FyeryModel
    var body: some View {
        Button("Logout") {
            model.signOut()
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(model: FyeryModel())
    }
}
