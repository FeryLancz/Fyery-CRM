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
            Image(systemName: "person.badge.plus")
                .bold()
                .padding(10)
                .background {
                    Circle()
                        .stroke(lineWidth: 2)
                }
            Text("Create".uppercased())
                .font(.title)
            Text("Prospect".uppercased())
                .font(.title)
                .bold()
            Spacer()
            Button {
                action()
            } label: {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
                    .font(.title)
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
