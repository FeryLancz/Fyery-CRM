//
//  PrimarySection.swift
//  Fyery
//
//  Created by Fery Lancz on 26.01.23.
//

import SwiftUI

struct PrimarySection<Content>: View where Content: View {
    var title: String?
    var verticalSpacing = 10
    var horizontalSpacing = 15
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            if let title = title {
                Heading2(title.uppercased())
            }
            VStack(alignment: .leading) { content() }
                .padding(10)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.background)
                        .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 0)
                }
        }
        .padding(.horizontal, CGFloat(horizontalSpacing))
        .padding(.vertical, CGFloat(verticalSpacing))
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
