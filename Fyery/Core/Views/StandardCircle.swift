//
//  StandardCircle.swift
//  Fyery
//
//  Created by Fery Lancz on 27.01.23.
//

import SwiftUI

struct StandardCircle: View {
    var body: some View {
        Circle()
            .stroke(lineWidth: 2)
            .frame(height: 40)
            .foregroundColor(.main)
            .padding(1)
    }
}

struct StandardCircle_Previews: PreviewProvider {
    static var previews: some View {
        StandardCircle()
            .previewLayout(.sizeThatFits)
    }
}
