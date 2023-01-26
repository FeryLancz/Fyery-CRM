//
//  SalesPartnerView.swift
//  Fyery
//
//  Created by Fery Lancz on 26.12.22.
//

import SwiftUI

struct SalesPartnerView: View {
    @EnvironmentObject private var user: SalesPartner
    @State private var addSalesPartnerViewShowing = false
    
    var body: some View {
        NavigationView {
            List(user.salesPartners) { sp in
                SalesPartnerListRowView(sp: sp)
            }
            .largeNavigationTitle("Sales Partners")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        addSalesPartnerViewShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $addSalesPartnerViewShowing) {
                AddSalesPartnerView()
            }
        }
    }
}



struct SalesPartnerView_Previews: PreviewProvider {
    static var previews: some View {
        SalesPartnerView()
            .environmentObject(SalesPartner())
    }
}
