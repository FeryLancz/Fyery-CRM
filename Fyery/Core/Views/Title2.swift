//
//  Title2.swift
//  Fyery
//
//  Created by Fery Lancz on 26.01.23.
//

import SwiftUI

struct Title2: View {
    var text: String
    
    init(_ text: String) {self.text = text}
    
    var body: some View {
        Text(text.uppercased())
            .font(.subheadline)
            .kerning(0.5)
            .foregroundColor(.main)
    }
}

struct Title2_Previews: PreviewProvider {
    static var previews: some View {
        Title2("Title 2")
    }
}
