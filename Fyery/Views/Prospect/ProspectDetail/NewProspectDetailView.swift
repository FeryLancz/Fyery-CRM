//
//  NewProspectDetailView.swift
//  Fyery
//
//  Created by Fery Lancz on 02.02.23.
//

import SwiftUI

struct NewProspectDetailView: View {
    @ObservedObject var prospect: Prospect
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        ScrollView(.vertical) {
            ZStack {
                Heading1(prospect.initials)
                    .bold()
                Circle()
                    .stroke(lineWidth: 2)
                    .frame(maxWidth: 50)
                    .foregroundColor(.main)
            }
            Title(prospect.fullName.uppercased())
            Subtitle(Date().formatted())
                .padding(.bottom, 15)
            HStack() {
                RoundedImageButton(title: "Call", systemName: "phone") {
                    Call.callNumber(prospect.phoneNumber)
                }
                RoundedImageButton(title: "Concept", systemName: "folder") { }
                RoundedImageButton(title: "Event", systemName: "plus") { }
            }
            PrimarySection(title: "COntact Info") {
                HStack {
                    Heading3("Phone Number:")
                    Spacer()
                    NormalText(prospect.phoneNumber)
                }
                Divider()
                    .tint(.main)
                HStack {
                    Heading3("COntact by:")
                    Spacer()
                    NormalText(prospect.contactorFullName)
                }
                Divider()
                    .tint(.main)
                HStack {
                    Heading3("Contact Type:")
                    Spacer()
                    NormalText(prospect.contactType.rawValue)
                }
                Divider()
                    .tint(.main)
                HStack {
                    Heading3("Advisor:")
                    Spacer()
                    NormalText(prospect.advisorFullName)
                }
            }
        }
        //.navigationBarBackButtonHidden(true)
        //        .toolbar {
        //            ToolbarItem(placement: .navigationBarLeading) {
        //                Button {
        //                    dismiss()
        //                } label: {
        //                    HStack {
        //                        Image(systemName: "chevron.left")
        //                            .fontWeight(.bold)
        //                            .foregroundColor(.main)
        //                        Heading3("Back")
        //                    }
        //
        //                }
        //            }
        //        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct NewProspectDetailView_Previes: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NewProspectDetailView(prospect: Prospect())
        }
    }
}
