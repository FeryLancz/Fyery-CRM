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
    @State var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                ForEach(user.prospects) { prospect in
                    NavigationLink(destination: ProspectDetailView(prospect: prospect)) {
                        ProspectListRowView(prospect)
                            
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.top, 10)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    PrimaryHeader(title: "Prospects", logoSystemName: "person")
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        addProspectShowing = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.action)
                            .heading2()
                    }
                }
            }
            .sheet(isPresented: $addProspectShowing) { AddProspectView() }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .applyBackground()
        }
    }
}

struct ProspectView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView()
            .environmentObject(SalesPartner(generateTestData: true))
    }
}


