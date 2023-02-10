//
//  ExpandableSection.swift
//  Fyery
//
//  Created by Fery Lancz on 09.02.23.
//

import SwiftUI

struct ExpandableSection<Content>: View where Content: View {
    var title: String?
    var verticalSpacing = 10
    var horizontalSpacing = 15
    @State var expanded = false
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                if let title = title {
                    Heading2(title.uppercased())
                }
                Spacer()
                Button {
                    withAnimation(.default) {
                        expanded.toggle()
                    }
                } label: {
                    if expanded {
                        Image(systemName: "chevron.down")
                    } else {
                        Image(systemName: "chevron.right")
                    }
                }
            }
            if expanded {
                VStack(alignment: .leading) {
                    
                    content()
                    
                }
                .frame(maxWidth: .infinity)
                .padding(10)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.background)
                        .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 0)
                }
            }
        }
        .padding(.horizontal, CGFloat(horizontalSpacing))
        .padding(.vertical, CGFloat(verticalSpacing))
    }
}

struct ExpandableSection_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableSection(title:"asdsada") {
            Text("AAA")
            Text("BBBB")
        }
        .previewLayout(.sizeThatFits)
    }
}
