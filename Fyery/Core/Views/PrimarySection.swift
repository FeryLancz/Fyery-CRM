//
//  PrimarySection.swift
//  Fyery
//
//  Created by Fery Lancz on 26.01.23.
//

import SwiftUI

struct PrimarySection<Content>: View where Content: View {
    var title: String?
    var spacing = 10
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        VStack(alignment: .leading) {
            if let title = title {
                Text(title.uppercased())
                    .foregroundColor(.main)
                    .bold()
            }
            VStack(alignment: .leading) { content() }
                .padding(10)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.background)
                        .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 0)
                }
        }
        //.padding(.horizontal, 15)
        .padding(.vertical, CGFloat(spacing))
    }
}

struct PrimarySection_Previews: PreviewProvider {
    static var previews: some View {
        PrimarySection(title: "Title") {
            Text("This is the content")
        }
        .previewLayout(.sizeThatFits)
    }
}
