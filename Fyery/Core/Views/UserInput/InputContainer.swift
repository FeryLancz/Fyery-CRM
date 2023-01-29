//
//  InputContainer.swift
//  Fyery
//
//  Created by Fery Lancz on 29.01.23.
//

import SwiftUI

struct InputContainer<Content>: View where Content: View {
    var title: String
    var subtitle: String?
    var alignment: HorizontalAlignment = .leading
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Heading3(title)
                Spacer()
            }
            .padding(.bottom, 3)
            content()
                .customAlign(alignment)
                .background {
                    Color.gray.opacity(0.2)
                        .cornerRadius(7, corners: [.topLeft, .topRight])
                }
            Rectangle()
                .frame(height: 3)
                .foregroundColor(.main)
            if let subtitle = subtitle {
                HStack {
                    Note(subtitle)
                    Spacer()
                }
                .padding(.top, 1)
                .padding(.bottom, 5)
            }
        }
    }
}

struct InputContainer_Previews: PreviewProvider {
    static var previews: some View {
        InputContainer(title: "Input Container") {
            Text("Input View goes here")
        }
    }
}
