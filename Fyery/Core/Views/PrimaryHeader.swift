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
            Image(systemName: logoSystemName)
                .bold()
                .padding(7)
                .background {
                    Circle()
                        .stroke(lineWidth: 2)
                }
                .padding(.trailing, 7)
            Text(title.uppercased())
                .font(.title)
                .fontWeight(!reverseBoldOrder ? .bold : .regular)
                .padding(.trailing, space ? 7 : 0)
            if let title2 = title2 {
                Text(title2.uppercased())
                    .font(.title)
                    .fontWeight(!reverseBoldOrder ? .regular : .bold)
            }
        }
        .foregroundColor(.main)
    }
}

struct PrimaryHeader_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryHeader(title: "create", title2: "prospect", logoSystemName: "person", reverseBoldOrder: false, space: true)
            .previewLayout(.sizeThatFits)
    }
}
