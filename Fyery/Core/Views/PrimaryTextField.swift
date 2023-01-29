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
        VStack(spacing: 0) {
            HStack {
                Heading3(title)
                Spacer()
            }
            .padding(.bottom, 3)
            TextField(placeholder, text: $input)
                .keyboardType(keyboardType ?? .default)
                .padding(10)
                .background {
                    Color.gray.opacity(0.2)
                        .cornerRadius(7, corners: [.topLeft, .topRight])
                }
            Rectangle()
                .frame(height: 3)
                .foregroundColor(.main)
            if let subtitle = subtitle {
                HStack {
                    Text(subtitle)
                        .foregroundColor(.main.opacity(0.5))
                        .font(.footnote)
                    Spacer()
                }
                .padding(.top, 1)
                .padding(.bottom, 5)
            }
        }
    }
}

struct PrimaryTextField_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryTextField(input: .constant("Text"), title: "Title", subtitle: "Subtitle")
            .previewLayout(.sizeThatFits)
    }
}
