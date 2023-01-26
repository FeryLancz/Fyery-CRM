//
//  SalesPartnerListRowView.swift
//  FyeryPrototype
//
//  Created by Fery Lancz on 26.01.23.
//

import SwiftUI

struct SalesPartnerListRowView: View {
    @ObservedObject var sp: SalesPartner
    
    var body: some View {
        Text(sp.fullName)
    }
}

struct SalesPartnerListRowView_Previews: PreviewProvider {
    static var previews: some View {
        SalesPartnerListRowView(sp: SalesPartner())
    }
}
