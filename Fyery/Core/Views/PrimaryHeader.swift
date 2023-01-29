//
//  PrimaryHeader.swift
//  Fyery
//
//  Created by Fery Lancz on 26.01.23.
//

import SwiftUI

struct PrimaryHeader: View {
    var title: String
    var title2: String?
    var logoSystemName: String
    var reverseBoldOrder = false
    var space = true
    
    var body: some View {
        HStack(spacing: 0) {
            CircularImage(systemName: logoSystemName)
                .padding(.trailing, 7)
            Heading1(title.uppercased())
                .fontWeight(!reverseBoldOrder ? .bold : .regular)
                .padding(.trailing, space ? 7 : 0)
            if let title2 = title2 {
                Heading1(title2.uppercased())
                    .fontWeight(!reverseBoldOrder ? .regular : .bold)
            }
        }
    }
}

struct PrimaryHeader_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryHeader(title: "create", title2: "prospect", logoSystemName: "display.2", reverseBoldOrder: false, space: true)
            .previewLayout(.sizeThatFits)
    }
}
