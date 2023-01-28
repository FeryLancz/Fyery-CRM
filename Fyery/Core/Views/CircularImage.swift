//
//  CircularImage.swift
//  Fyery
//
//  Created by Fery Lancz on 27.01.23.
//

import SwiftUI

struct CircularImage: View {
    var systemName: String
    var body: some View {
        ZStack {
            Image(systemName: systemName)
                .font(.callout)
                .bold()
            StandardCircle()
        }
        .foregroundColor(.main)
    }
}

struct CircularImage_Previews: PreviewProvider {
    static var previews: some View {
        CircularImage(systemName: "phone")
    }
}
