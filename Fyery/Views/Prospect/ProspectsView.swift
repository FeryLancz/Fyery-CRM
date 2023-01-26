//
//  ProspectView.swift
//  Fyery
//
//  Created by Fery Lancz on 26.12.22.
//

import SwiftUI

struct ProspectsView: View {
    @EnvironmentObject var user: SalesPartner
    @State private var addProspectShowing = false
    @State private var newAddProspectShowing = false
    
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
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("+test") {
                        newAddProspectShowing.toggle()
                    }
                }
            }
            .sheet(isPresented: $addProspectShowing) {
                AddProspectView()
            }
            .sheet(isPresented: $newAddProspectShowing) {
                AddProspectNew()
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
        ProspectsView()
            .environmentObject(SalesPartner(generateTestData: true))
    }
}


