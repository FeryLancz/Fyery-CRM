//
//  CallsView.swift
//  Fyery
//
//  Created by Fery Lancz on 26.12.22.
//

import SwiftUI

struct CallsView: View {
    @EnvironmentObject var user: SalesPartner
    
    var body: some View {
        Text("Calls View")
    }
}

struct CallsView_Previews: PreviewProvider {
    static var previews: some View {
        CallsView()
    }
}
