//
//  ProspectView.swift
//  FyeryPrototype
//
//  Created by Fery Lancz on 26.12.22.
//

import SwiftUI

struct ProspectView: View {
    @EnvironmentObject var user: SalesPartner
    @State private var addProspectShowing = false
    
    var body: some View {
        NavigationView {
            List(user.prospects) { prospect in
                NavigationLink(destination: ProspectDetailView(prospect: prospect)) {
                    ProspectCellView(prospect: prospect)
                }
            }
            .navigationTitle("Prospects")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        addProspectShowing = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $addProspectShowing) {
                AddProspectView()
            }
        }
    }
}

struct ProspectCellView: View {
    @ObservedObject var prospect: Prospect
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(prospect.fullName)
            Text(prospect.phoneNumber)
                .font(.footnote)
        }
    }
}

struct ProspectView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectView()
            .environmentObject(SalesPartner(generateTestData: true))
    }
}


