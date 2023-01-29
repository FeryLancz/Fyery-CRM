//
//  AddProspectHeaderView.swift
//  Fyery
//
//  Created by Fery Lancz on 26.01.23.
//

import SwiftUI

struct AddProspectHeaderView: View {
    var action: () -> Void
    var body: some View {
        HStack {
            PrimaryHeader(title: "Create", title2: "Prospect", logoSystemName: "person.badge.plus", reverseBoldOrder: true)
            Spacer()
            Button {
                action()
            } label: {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.confirm)
                    .font(.title3)
                    .bold()
            }
        }
        .foregroundColor(.main)
        .padding()
    }
}

struct AddProspectHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AddProspectHeaderView(action: {})
    }
}
