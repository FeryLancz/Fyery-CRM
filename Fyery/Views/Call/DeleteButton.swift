//
//  DeleteButton.swift
//  Fyery
//
//  Created by Fery Lancz on 09.02.23.
//

import SwiftUI

struct DeleteButton: View {
    @Binding var text: String
    
    var body: some View {
        Button {
            text = String(text.dropLast())
        } label: {
            Image(systemName: "delete.left.fill")
                .foregroundColor(.cancel)
                .title()
        }
    }
}

struct DeleteButton_Previews: PreviewProvider {
    static var previews: some View {
        DeleteButton(text: .constant(""))
            .previewLayout(.sizeThatFits)
    }
}
