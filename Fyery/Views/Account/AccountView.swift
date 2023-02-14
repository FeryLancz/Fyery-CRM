//
//  AccountView.swift
//  Fyery
//
//  Created by Fery Lancz on 26.12.22.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var model: FyeryModel
    var body: some View {
        List {
            Button("Logout") {
                model.signOut()
            }
            Toggle("Call Debug Mode", isOn: $model.callDebugMode)
        }
        
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
