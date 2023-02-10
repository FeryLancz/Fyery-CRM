//
//  PrimarySection.swift
//  Fyery
//
//  Created by Fery Lancz on 26.01.23.
//

import SwiftUI

struct PrimarySection<Content>: View where Content: View {
    var title: String?
    var verticalSpacing: CGFloat = 10.0
    var horizontalSpacing: CGFloat = 15.0
    var insideSpacing: CGFloat = 10.0
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            if let title = title {
                Heading2(title.uppercased())
            }
            VStack(alignment: .leading, spacing: insideSpacing) { content() }
                .frame(maxWidth: .infinity)
                .padding(10)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.background)
                        .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 0)
                }
        }
        .padding(.horizontal, horizontalSpacing)
        .padding(.vertical, verticalSpacing)
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
