//
//  PrimaryTextField.swift
//  Fyery
//
//  Created by Fery Lancz on 26.01.23.
//

import SwiftUI

struct PrimaryTextField: View {
    @Binding var input: String
    var title: String
    var subtitle: String?
    var placeholder = ""
    var keyboardType: UIKeyboardType?
    
    var body: some View {
        InputContainer(title: title, subtitle: subtitle) {
            TextField(placeholder, text: $input)
                .keyboardType(keyboardType ?? .default)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
        }
    }
}

struct PrimaryTextField_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryTextField(input: .constant("Text"), title: "Title", subtitle: "Subtitle")
            .previewLayout(.sizeThatFits)
    }
}
